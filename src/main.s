.extern printf
.extern scanf
.extern srand
.extern rand

.section .data
user_seed:
    .long 0
user_guess:
    .long 0

.section .rodata
scanf_fmt:
    .string "%d"
welcome_string:
    .string "\033[0;32mEnter configuration seed: \033[0m"
guess_string:
    .string "\033[0;32mWhat is your guess? \033[0m"
wrong_guess_string:
    .string "\033[0;32mIncorrect.\n\033[0m"
correct_guess_string:
    .string "\033[0;32m🎉 Congratz! You won! 🎉\n\033[0m"
game_over_string:
    .string "\033[0;32mGame over, you lost :(. The correct answer was %d\n\033[0m"

.section .text
.global main
.type main, @function 
main:
    # start
    pushq %rbp
    movq %rsp, %rbp 

    # print the welcome string
    movq $welcome_string, %rdi
    xorq %rax, %rax
    call printf

    # read the seed value
    movq $scanf_fmt, %rdi
    movl $user_seed, %esi
    xorq %rax, %rax
    call scanf

    # generate random number
    movq user_seed, %rdi
    call srand
    call rand
    movq %rax, %rbx
    xorq %rax, %rax

    # mod 10
    xorq %rax, %rax
    movq %rbx, %rax
    xorq %rdx, %rdx
    movq $10, %rcx
    div %rcx
    movq %rdx, %rsi
    movq %rdx, %r15
    xorq %rax, %rax

    # start the game
    xorq %rax, %rax
    movq %r15, %rdi
    call game

    # end
    xorq %rax, %rax
    movq %rbp, %rsp
    popq %rbp
    ret

.type game, @function 
game:
    # start
    pushq %rbp
    movq %rsp, %rbp 

    # game loop
    xorq %r14, %r14
    movq %rdi, %r13
.loop:
    cmpq $5, %r14
    je .loose

    # print enter guess string
    movq $guess_string, %rdi
    xorq %rax, %rax
    call printf
    xorq %rax, %rax

    # read the guess
    movq $scanf_fmt, %rdi
    movl $user_guess, %esi
    xorq %rax, %rax
    call scanf

    # check if the guess was right
    cmpq user_guess, %r13
    jne .wrong
    je .right

.iterator:
    # continue the loop
    inc %r14
    jmp .loop
    
.wrong:
    # print the wrong guess string
    movq $wrong_guess_string, %rdi
    xorq %rax, %rax
    call printf
    xorq %rax, %rax
    jmp .iterator

.right:
    # print the right guess string
    movq $correct_guess_string, %rdi
    xorq %rax, %rax
    call printf
    xorq %rax, %rax
    jmp .done

.loose:
    # print the loosing string
    movq $game_over_string, %rdi
    movq %r13, %rsi
    xorq %rax, %rax
    call printf
    jmp .done

.done:
    # end
    xorq %rax, %rax
    movq %rbp, %rsp
    popq %rbp
    ret

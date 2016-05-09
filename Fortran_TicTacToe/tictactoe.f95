
! Main program which play the game of tic-tac-toe vs a computer
program TICTACTOE
    implicit none
    character TICTAC(3,3), WINNER
    logical :: OVER, CHKPLAY
    integer :: MOVE, TURN,ios

    OVER = .FALSE.
    WINNER = " "
    
    call HOWTOPLAY
    call BOARDSETUP(TICTAC)
   
    TURN =0
    ! main game loop 
    do 
        print* ,'your move'
        read(*,*,iostat=ios) MOVE
        
        ! check validity of move if invalid next cycle loop
        IF (ios .NE. 1  .AND. MOVE > 0 .AND. MOVE <= 9 ) THEN
        
            ! play move position if available, else pos occupied
            IF(CHKPLAY(TICTAC,MOVE)) THEN
                CALL PLAYERMOVE(TICTAC, MOVE)
            ELSE
                print* ,"Invalid move"
                CYCLE
            endif
        ELSE
             print* ,'move is invalid'
             CYCLE
        ENDIF
        
        
        ! player move
        IF (TURN == 0) THEN
            print*, "After your move..."
            CALL DRAWBOARD(TICTAC)
            CALL CHKOVR(TICTAC,OVER,WINNER)
			
            IF(OVER) THEN
                CALL CHKWINNER(WINNER)
                EXIT
            ENDIF
            TURN = 1
        ENDIF
		
		!computer move
        IF (TURN == 1) THEN
            print*, "After my move..."
            CALL COMPMOVE(TICTAC)
            CALL DRAWBOARD(TICTAC)
            CALL CHKOVR(TICTAC,OVER,WINNER)
            TURN =0
            IF(OVER) THEN
                CALL CHKWINNER(WINNER)
                EXIT
            ENDIF
        ENDIF
        
        if(OVER ) then
            exit 
        endif
    enddo
    
end program TICTACTOE


!DRAW BOARD
subroutine HOWTOPLAY 
WRITE(*,*) "PLAY TIC-TAC-TOE. ENTER 1-9 TO PLAY"
WRITE(*,*) " "
WRITE(*,*) "        1 | 2 | 3 "
WRITE(*,*) "       ---+---+---"
WRITE(*,*) "        4 | 5 | 6 "
WRITE(*,*) "       ---+---+---"
WRITE(*,*) "        7 | 8 | 9 "
WRITE(*,*) " "
END subroutine HOWTOPLAY

! CHECKWINNER - check outcome of the game
subroutine CHKWINNER(WINNER)
    character WINNER
    print*,'The game is over!'
    IF (WINNER == "D") THEN
        PRINT*,'The game is a draw. '
    ELSE
        PRINT*,'The winner is ', WINNER
    ENDIF
END subroutine CHKWINNER

!DRAWBOARD - draw board after plays
subroutine DRAWBOARD(TICTAC) 
    CHARACTER TICTAC(3,3)
    400 FORMAT(2X,A1,1X,"|",1X,A1,1X,"|",1X,A1,1X)

    DO I=1,3
        WRITE(*,400) (TICTAC(I,J), J=1,3)
        IF (I == 1 .OR. I == 2) WRITE(*,*) "---+---+---"
    END DO

END subroutine DRAWBOARD

!PLAYERMOVE - PLAY PLAYER MOVE X ON BOARD
subroutine PLAYERMOVE (TICTAC, MOVE)
    CHARACTER TICTAC(3,3)
    INTEGER MOVE

    IF (MOVE == 1) TICTAC(1,1) = "X"
    IF (MOVE == 2) TICTAC(1,2) = "X"
    IF (MOVE == 3) TICTAC(1,3) = "X"
    IF (MOVE == 4) TICTAC(2,1) = "X"
    IF (MOVE == 5) TICTAC(2,2) = "X"
    IF (MOVE == 6) TICTAC(2,3) = "X"
    IF (MOVE == 7) TICTAC(3,1) = "X"
    IF (MOVE == 8) TICTAC(3,2) = "X"
    IF (MOVE == 9) TICTAC(3,3) = "X"
END subroutine PLAYERMOVE

!CHKOVR - CHECK TO SEE IF THE GAME IS OVER
subroutine CHKOVR(TICTAC,OVER,WINNER)
    CHARACTER TICTAC(3,3),WINNER
    LOGICAL OVER
    INTEGER IR, IC
    LOGICAL SAME
    
    OVER =.TRUE.
    !check rows for winner
    DO IR = 1, 3
        IF (SAME(TICTAC(IR,1),TICTAC(IR,2),TICTAC(IR,3))) THEN
            WINNER = TICTAC(IR,1)
            OVER =.TRUE.
      END IF
    END DO
    
    !check columns for winner
    DO IC = 1, 3
        IF (SAME(TICTAC(1,IC),TICTAC(2,IC),TICTAC(3,IC))) THEN
            WINNER = TICTAC(1,IC)
            OVER =.TRUE.
      END IF
    END DO
    
    !check diagonal for winner
    IF(SAME(TICTAC(1,1),TICTAC(2,2),TICTAC(3,3)) .OR. &
    SAME(TICTAC(1,3),TICTAC(2,2),TICTAC(3,1))) THEN
        WINNER = TICTAC(2,2)
        OVER =.TRUE.
    END IF
    
    !no winner check if theres an empty space
    IF (WINNER == " ") THEN
        DO IR = 1,3
            DO IC = 1,3
                IF (TICTAC(IR,IC) ==" " ) THEN
                    OVER = .FALSE.
                    RETURN
                END IF
            END DO
        END DO
    END IF
    IF (WINNER == " ") WINNER = "D"
    
END subroutine CHKOVR

!SAME - FUNCTION TO CHECK TO SEE IF THREE ELEMENTS IN A ROW, COLUMN OR DIAGONAL
LOGICAL FUNCTION SAME(T1,T2,T3) 
    CHARACTER T1,T2,T3
    IF (T1 == "X" .AND. T2 == "X" .AND. T3 == "X") THEN
        SAME = .TRUE.
    ELSE IF (T1 == "O" .AND. T2 == "O" .AND. T3 == "O") THEN
        SAME = .TRUE.
    ELSE
        SAME = .FALSE.
    END IF
END FUNCTION SAME

!BOARDSETUP - SET UP THE TIC-TAC-TOE BOARD
subroutine BOARDSETUP(TICTAC)
character TICTAC(3,3) 
    DO I=1,3
        DO J=1,3
            TICTAC(I,J) = " "
        END DO
    END DO
END subroutine BOARDSETUP

!CHKPLAY - CHECK HUMAN PLAY 
!check if position is empty, returns T or F
LOGICAL FUNCTION CHKPLAY(TICTAC,MOVE) 
    CHARACTER TICTAC(3,3)
    INTEGER MOVE

    select CASE(MOVE)
        CASE(1)
            CHKPLAY =(TICTAC(1,1) == " ")
        CASE(2)
            CHKPLAY =(TICTAC(1,2) == " ")
        CASE(3)
            CHKPLAY =(TICTAC(1,3) == " ")
        CASE(4)
            CHKPLAY =(TICTAC(2,1) == " ")
        CASE(5)
            CHKPLAY =(TICTAC(2,2) == " ")
        CASE(6)
            CHKPLAY =(TICTAC(2,3) == " ")
        CASE(7)
            CHKPLAY =(TICTAC(3,1) == " ")
        CASE(8)
            CHKPLAY =(TICTAC(3,2) == " ")
        CASE(9)
            CHKPLAY =(TICTAC(3,3) == " ")
    END select

END FUNCTION CHKPLAY

!COMPMOVE - PLAY FOR THE COMPUTER
subroutine COMPMOVE(TICTAC)
 
    CHARACTER TICTAC(3,3)
    INTEGER PATHS(3,8), PATHSUM(8)
    INTEGER BOARD(9,2), K, X, Y, RANDPOS

    PATHS = reshape ((/1,2,3,4,5,6,7,8 &
                      ,9,1,4,7,2,5,8,3 &
                      ,6,9,1,5,9,3,5,7/),(/3,8/))
    BOARD= reshape ((/1,1,1,2,2,2,3,3,3,1,2,3,1,2,3,1,2,3/),(/9,2/))
    
    ! calculate pathsums
    DO I=1,8
        PATHSUM(I) = 0
        DO J=1,3
            X = BOARD(PATHS(J,I),1)
            Y = BOARD(PATHS(J,I),2)
            IF (TICTAC(X,Y) == " ") K = 0
            IF (TICTAC(X,Y) == "X") K = 1
            IF (TICTAC(X,Y) == "O") K = 4 
            PATHSUM(I) = PATHSUM(I) + K 
        END DO
    END DO
    
    !ofense, where computer has two in a path
    DO I = 1,8
        IF (PATHSUM(I) == 8) THEN
            DO J = 1,3
                X = BOARD(PATHS(J,I),1)
                Y = BOARD(PATHS(J,I),2)
                IF (TICTAC(X,Y) == " ") THEN
                    TICTAC(X,Y) = "O" 
                    RETURN
                END IF
            END DO
        END IF
    END DO
    
    !defense, opponent has two in path
    DO I = 1,8
      IF (PATHSUM(I) == 2) THEN
            DO J = 1,3
                X = BOARD(PATHS(J,I),1)
                Y = BOARD(PATHS(J,I),2)
                IF (TICTAC(X,Y) .EQ. " ") THEN
                    TICTAC(X,Y) = "O"
                    RETURN
                END IF
            END DO
      END IF
    END DO
    
    !play random position
    DO
    RANDPOS = INT(rand()*9)+1
        X = BOARD(RANDPOS,1)
        Y = BOARD(RANDPOS,2)
      IF (TICTAC(X,Y) == " ") THEN
          TICTAC(X,Y) = "O"
          RETURN
      END IF
    END DO
    
END subroutine COMPMOVE





module fdm
  use gauss
  use precision
  implicit none

contains

  subroutine generate_matrix(n, array1, array2, start, end)
    implicit none
    
    integer (kind = 4), intent(in) :: n, start, end
    real (kind = prec), allocatable, dimension(:,:), intent(out)  :: array1
    real (kind = prec), allocatable, dimension(:), intent(out) :: array2
    integer (kind = 4) :: i, j
   
    allocate (array1(n,n))
    allocate (array2(n))

    array1 = 0
    array2 = 0

    do i = 1,n
      do j = 1,n
        if (i .EQ. j) then
          array1(i,j) = 2*n*n
          else if ((i+1 .EQ. j) .OR. (i-1 .EQ. j)) then
            array1(i,j) = -n*n
        end if
      end do
    end do

    array1(1,1) = end
    array1(2,1) = 0
    array1(n,n) = 1
    array1(n-1,n) = 0

    array2(1) = start
    array2(n) = end

  end subroutine

  subroutine count_error(n, array, error)
    implicit none
    integer (kind = 4), intent(in) :: n
    real (kind = prec), allocatable, dimension(:), intent(in)  :: array
    real (kind = 16), intent(out) :: error
    integer (kind = 4) :: i
    real (kind = 16) :: step

    error = 0
    step = 1/real(n-1, prec)

    do i = 2,n
      error = error + abs(array(i) - (step*(i-1)))
    end do

  end subroutine

  function run_fdm(n) result (error)
    integer (kind = 4), intent(in) :: n
    real (kind = 16) :: error
    real (kind = prec), allocatable, dimension(:,:) :: array1
    real (kind = prec), allocatable, dimension(:) :: array2

    allocate (array1(n,n))
    allocate (array2(n))

    call generate_matrix(n, array1, array2, 0, 1)

    call solve(n, array1, array2)

    call count_error(n, array2, error)

  end function

end module
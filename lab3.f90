module gauss
  implicit none
  
contains

  subroutine x()
    implicit none
    write (*,*) "xd"
  end subroutine

  subroutine solve(n, a, x)
    implicit none
    integer (kind = 4), intent(in) :: n
    real (kind = 8), intent(inout) :: a(n, n)
    real (kind = 8), intent(inout) :: x(n)
    integer (kind = 4) :: i, j
    real (kind = 8) :: c
    do i = 1,n
      do j = 1,n
        if (i .NE. j) then
          c = a(i,j)/a(i,i)
          a(:,j) = a(:,j) - c*a(:,i)
          x(j) = x(J) - c*x(i)
          x(i) = x(i)/a(i,i)
          a(:,i) = a(:,i)/a(i,i)
        end if
      end do
    end do
  end subroutine solve

end module


program main
  use gauss
  implicit none
  
  integer (kind = 4), parameter :: n = 10
  real (kind = 8), allocatable, dimension(:,:)  :: array1
  real (kind = 8), allocatable, dimension(:) :: array2

  allocate (array1(n,n))
  allocate (array2(n))

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write (*,*) array1

  call solve(n, array1, array2)
  
  write (*,*) array1

end program

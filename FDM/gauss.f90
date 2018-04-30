module gauss
  use precision
  implicit none

contains

  subroutine solve(n, a, x)
    implicit none
    integer (kind = 4), intent(in) :: n
    real (kind = prec), intent(inout) :: a(n, n)
    real (kind = prec), intent(inout) :: x(n)
    integer (kind = 4) :: i, j
    real (kind = prec) :: c
    do i = 1,n
      do j = 1,n
        if (i .NE. j) then
          c = a(i,j)/a(i,i)
          a(:,j) = a(:,j) - c*a(:,i)
          x(j) = x(j) - c*x(i)
          x(i) = x(i)/a(i,i)
          a(:,i) = a(:,i)/a(i,i)
        end if
      end do
    end do
  end subroutine solve

end module
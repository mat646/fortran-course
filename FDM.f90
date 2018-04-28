module FDM
  implicit none

contains

  subroutine generate_matrix(n, array1, array2, start, end)
    implicit none
    integer (kind = 4), intent(in) :: n, start, end
    !integer (kind = kind(n)), intent(in) :: prec

    real (kind = 8), allocatable, dimension(:,:), intent(out)  :: array1
    real (kind = 8), allocatable, dimension(:), intent(out) :: array2
    integer::i,j

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
    !array1(n,n) = 1

    array2(1) = start
    array1(n,n) = 1
    array1(n-1,n) = 0
    array2(n) = 1

  end subroutine

end module
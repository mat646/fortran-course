module mult
  implicit none

contains

  subroutine mm(first, second, multiply, status)
    implicit none
    real (kind = 8), intent(in) :: first(:,:)
    real (kind = 8), intent(in) :: second(:,:)
    real (kind = 8), intent(out) :: multiply(:,:)
    integer (kind = 4), intent(out) :: status
    integer (kind = 4) :: first_dim(2), second_dim(2), i, j, k
  
    first_dim = SHAPE(first)
    second_dim = SHAPE(second)

    do i = 1,first_dim(1)
      do j = 1,first_dim(2)
        do k = 1,first_dim(2)

          multiply(i,j) = multiply(i,j) + first(i,k)*second(j,k)

        end do
      end do
    end do


    status = 0


  end subroutine

end module
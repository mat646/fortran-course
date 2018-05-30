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

    if (first_dim(1) .NE. second_dim(2)) then
      status = 1
    else

    do i = 1,first_dim(2)
      do j = 1,first_dim(2)
        do k = 1,first_dim(1)

          multiply(i,j) = multiply(i,j) + first(k, i)*second(j, k)

        end do
      end do
    end do

    status = 0

    end if

  end subroutine


  subroutine mm_version_2(first, second, multiply, status)
    implicit none
    real (kind = 8), intent(in) :: first(:,:)
    real (kind = 8), intent(in) :: second(:,:)
    real (kind = 8), intent(out) :: multiply(:,:)
    integer (kind = 4), intent(out) :: status
    integer (kind = 4) :: first_dim(2), second_dim(2), i, j
  
    first_dim = SHAPE(first)
    second_dim = SHAPE(second)

    if (first_dim(1) .NE. second_dim(2)) then
      status = 1 
    else

    do i = 1,first_dim(2)
      do j = 1,first_dim(2)

        multiply(i,j) = dot_product(first(:,i),second(j,:))

      end do
    end do

    status = 0

    end if

  end subroutine

end module
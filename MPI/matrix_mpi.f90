   !---------------------------------------------------------------------------  
   !> @author 
   !> Mateusz Sokol
   !
   ! DESCRIPTION: 
   !> Routine solving system of equations with gauss method. 
   !
   ! REVISION HISTORY:
   ! 18 06 2018 - Initial Version
   !
   !> @param[in] n - size of matrix
   !> @param[inout] a - main matrix
   !> @param[inout] x - right size vector 
   !--------------------------------------------------------------------------- 
  subroutine gauss(n, a, x)
    implicit none
    integer, intent(in) :: n
    real, dimension(n,n), codimension[*], intent(inout) :: a
    real, dimension(n), codimension[*], intent(inout) :: x
    integer :: i, j
    real :: c
    !f2py intent(in, out) a, x
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
  end subroutine gauss

   !---------------------------------------------------------------------------  
   !> @author 
   !> Mateusz Sokol
   !
   ! DESCRIPTION: 
   !> Routine multiplying two matrixices. 
   !
   ! REVISION HISTORY:
   ! 18 06 2018 - Initial Version
   !
   !> @param[in] first - first matrix
   !> @param[in] second - second matrix
   !> @param[out] multiply - the result of multiplication
   !> @param[out] status - in case of error set to 1
   !--------------------------------------------------------------------------- 
  subroutine mult(n, m, first, second, multiply)
    implicit none
    integer, intent(in) :: n, m
    real, dimension(n, m), intent(in) :: first
    real, dimension(m, n), intent(in) :: second
    real, dimension(m, m), codimension[*], intent(out) :: multiply
    integer :: i, j, k, img, num, dist, ibeg, iend

   img = this_image()
   num = num_images()

   dist = m/num

   ibeg = 1+dist*((img-1))
   iend = dist*(img)

    !f2py intent (out) :: multiply
    do i = ibeg,iend
      do j = 1,m
        do k = 1,n
          multiply(i,j) = multiply(i,j) + first(k, i)*second(j, k)
        end do
      end do
    end do
  end subroutine mult

program main
  implicit none

  real (kind = 4), allocatable, dimension(:,:) :: martix1
  real (kind = 4), allocatable, dimension(:,:) :: martix2
  real (kind = 4), allocatable, dimension(:,:) :: result
  integer :: img, num, n

  allocate (martix1(3,3))
  allocate (martix2(3,3))
  allocate (result(3,3))

  call RANDOM_NUMBER(martix1)
  call RANDOM_NUMBER(martix2)

  img = this_image()
  num = num_images()

  call mult(3,3, martix1, martix2, result)

  syncall()

  if (img .EQ. 1) then
    write (*,*) martix1
    write (*,*) martix2
    write (*,*) result
  end if

end program main
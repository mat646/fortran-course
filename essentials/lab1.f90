#define ASIZE 10

subroutine mm(arr, asize, suma)
  implicit none
  integer (kind = 4), intent(in) :: asize
  integer (kind = 4), intent(in) :: arr(asize)
  integer (kind = 4), intent(out) :: suma
  integer (kind = 4) :: i
  do i=1, asize
    suma = suma + arr(i)
  end do
end subroutine mm

function fun(a) result (val)
  implicit none
  integer (kind = 4), intent(in) :: a
  integer (kind = 4) :: val
  val = a + 10
end function fun

program main
  implicit none
  real (kind = 8) :: first(100, 100) 

  integer (kind = 4) :: arr(ASIZE), fun
  integer (kind = 4) :: j, k, i, arr2(10,5)

  j = 0
  read *, k

  do i=1, ASIZE
    arr(i) = i
  end do

  write (*,*) arr
  write (*,*) size(arr2(1,:))

  call mm(arr, ASIZE, j)

  write (*,*) j

  k = fun(2)
  write (*,*) k 

end program main

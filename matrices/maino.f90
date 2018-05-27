program maino
  use mult
  implicit none
  
  integer (kind = 4) :: i, n = 3, m = 5
  real (kind = 8), allocatable, dimension(:,:) :: array1
  real (kind = 8), allocatable, dimension(:,:) :: array2
  real (kind = 8), allocatable, dimension(:,:) :: array3
  character(len = 5) :: s, t

  allocate (array1(n,m))
  allocate (array2(m,n))
  allocate (array3(m,m))
  write (s,"(i2)") n
  write (t,"(i2)") m

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array2
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array3
  write (*,*) NEW_LINE('')

  call mm(array1, array2, array3, i)

  write(*,*) NEW_LINE('')

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array2
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array3
  write (*,*) NEW_LINE('')

end program
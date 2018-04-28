program main
  use gauss
  use fdm
  implicit none
  
  integer (kind = 4), parameter :: n = 4
  real (kind = 8), allocatable, dimension(:,:)  :: array1
  real (kind = 8), allocatable, dimension(:) :: array2
  character(len=10) s

  write (s,'(I10)') n

  

  allocate (array1(n,n))
  allocate (array2(n))

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write (*,"("//s//"f10.5)") array1
  write(*,*) NEW_LINE('')
  write (*,"("//s//"f10.5)") array2
  write(*,*) NEW_LINE('')

  call solve(n, array1, array2)
  
  write (*,"("//s//"f10.5)") array1
  write(*,*) NEW_LINE('')
  write (*,"("//s//"f10.5)") array2
  write(*,*) NEW_LINE('')
  
end program

program main
  use FDM
  use gauss
  implicit none
  
  integer (kind = 4) :: n
  real (kind = 8), allocatable, dimension(:,:)  :: array1
  real (kind = 8), allocatable, dimension(:) :: array2
  character(len = 5) s

  integer::length,status

  call get_command_argument(1,s,length,status)

  read (s,'(I10)') n

  write (*,*) n

  write (*,*) s

  allocate (array1(n,n))
  allocate (array2(n))

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write (*,"("//s//"f10.5)") array1
  write(*,*) NEW_LINE('')
  write (*,"("//s//"f10.5)") array2
  write(*,*) NEW_LINE('')

  call generate_matrix(n, array1, array2, 0, 1)

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
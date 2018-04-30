program main
  use fdm
  use gauss
  use precision
  implicit none
  
  integer (kind = 4) :: n
  real (kind = prec), allocatable, dimension(:,:) :: array1
  real (kind = prec), allocatable, dimension(:) :: array2
  character(len = 5) :: s
  real(kind = 16) :: error

  call get_command_argument(1,s)
  read (s,'(I10)') n

  allocate (array1(n,n))
  allocate (array2(n))

  call generate_matrix(n, array1, array2, 0, 1)

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//s//"f10.5)") array2
  write (*,*) NEW_LINE('')

  call solve(n, array1, array2)

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//s//"f10.5)") array2
  write (*,*) NEW_LINE('')

  call count_error(n, array2, error)

  write(*,*) error
  
end program
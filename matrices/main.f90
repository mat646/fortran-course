program maino
  use mult
  implicit none
  
  integer (kind = 4) :: i, n, m
  real (kind = 8), allocatable, dimension(:,:) :: array1
  real (kind = 8), allocatable, dimension(:,:) :: array2
  real (kind = 8), allocatable, dimension(:,:) :: array3
  character(len = 5) :: s, t, fun_type

  call get_command_argument(1,s)
  read (s,'(I10)') n
  call get_command_argument(2,t)
  read (t,'(I10)') m
  call get_command_argument(3,fun_type)

  allocate (array1(n,m))
  allocate (array2(m,n))
  allocate (array3(m,m))

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array2
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array3
  write (*,*) NEW_LINE('')

  if (fun_type .EQ. 'basic') then
      write (*,*) "using basic version"
      call mm(array1, array2, array3, i)
    else
      write (*,*) "using improved version"
      call mm_version_2(array1, array2, array3, i)
  end if

  write(*,*) NEW_LINE('')

  write (*,"("//s//"f10.5)") array1
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array2
  write (*,*) NEW_LINE('')
  write (*,"("//t//"f10.5)") array3
  write (*,*) NEW_LINE('')

end program
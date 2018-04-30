program main
  use fdm
  use precision
  implicit none
  
  integer (kind = 4) :: i, n = 20
  real (kind = 16), allocatable, dimension(:) :: array

  allocate (array(n))

  write(*,*) NEW_LINE('')

  do i = 1,n
    array(i) = run_fdm(i*40)
    write(*,*) array(i)
  end do
  
end program
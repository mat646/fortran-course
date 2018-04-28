program main
  use fdm
  implicit none
  
  integer (kind = 4) :: i, n = 10
  real (kind = 16), allocatable, dimension(:) :: array

  allocate (array(n))

  do i = 1,n
    array(i) = run_fdm(i*100)
    write(*,*) array(i)
  end do
  
end program
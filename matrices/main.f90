program main
  use mult
  implicit none
  
  integer (kind = 4) :: i, n = 2
  real (kind = 8), allocatable, dimension(:,:) :: array1
  real (kind = 8), allocatable, dimension(:,:) :: array2
  real (kind = 8), allocatable, dimension(:,:) :: array3

  allocate (array1(n,n))
  allocate (array2(n,n))
  allocate (array3(n,n))

  call RANDOM_NUMBER(array1)
  call RANDOM_NUMBER(array2)

  write(*,*) NEW_LINE('')

  WRITE(*,*) array1
  WRITE(*,*) array2
  WRITE(*,*) array3

  call mm(array1, array2, array3, i)

    write(*,*) NEW_LINE('')

  WRITE(*,*) array1
  WRITE(*,*) array2
  WRITE(*,*) array3
  
end program
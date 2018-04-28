function fun(x) result (val)
  implicit none
  real (kind = 4), intent(in) :: x
  real (kind = 4) :: val
  val = x**3 + 5*(x**2) + 10*x + 7
end function fun

function num_int(density, begin, ende) result (area)
  implicit none
  real (kind = 4), intent(in) :: begin, ende
  integer (kind = 4), intent(in) :: density
  real (kind = 4) :: array(density+3)
  real (kind = 4) :: area, step, fun
  integer (kind = 4) :: i

  step = (ende - begin) / density

  do i=1, density
    array(i) = fun(i * step) + fun((i+1)*step)
  end do

  array = array * step

  area = sum(array)

end function num_int

program main
  implicit none
  real (kind = 4) :: j, k, num_int, fun_res
  integer (kind = 4) :: i

  read *, i
  read *, j
  read *, k

  fun_res = num_int(i, j, k)

  write (*,*) fun_res

end program main

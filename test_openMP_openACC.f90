program hello
  !!$ use omp_lib
  !!$ call omp_set_num_threads()
  !$acc kernels
  !!$OMP parallel
   write(*,*) 'hello'
  !!$OMP end parallel
  !$acc end kernels 
 
end program hello

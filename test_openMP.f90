program test_openMP
  implicit none
   !$ use omp_lib
   !$ call omp_set_num_threads()
   !$omp parallel
    write(*,*) 'hello'
   !$omp end parallel
   
end program test_openMP

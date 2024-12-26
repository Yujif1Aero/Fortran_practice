program helloOpenMPACC
!$ use omp_lib
  implicit none
  integer ::n,k,j
  integer,allocatable :: x(:),y(:)
  write(*,*) 'START'
  n=0
!$omp parallel private(k,x)
  !$  n=omp_get_num_threads()
  allocate (x(n))
  k= omp_get_thread_num()+1
  x(k) = k+1

!$omp barrier
  write(*,*) 'N =',n, ' and I am ', x(k),k
!$omp barrier
  
!$omp end parallel
  write(*,*) 'N =',n
  do j = 1, n
     if(mod(j, 2) == 0) then
        !$acc kernels
        write(*,*) 'ACC' ,j
        !$acc end kernels
     else
        write(*,*) 'MP ' ,j,omp_get_thread_num()
     endif
  enddo

  print *, 'END'
end

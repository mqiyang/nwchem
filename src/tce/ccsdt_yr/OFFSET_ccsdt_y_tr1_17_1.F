      SUBROUTINE OFFSET_ccsdt_y_tr1_17_1(l_a_offset,k_a_offset,size)
C     $Id$
C     This is a Fortran77 program generated by Tensor Contraction Engine v.1.0
C     Copyright (c) Battelle & Pacific Northwest National Laboratory (2002)
C     i1 ( p11 p14 h13 p1 )_ytrt
      IMPLICIT NONE
#include "global.fh"
#include "mafdecls.fh"
#include "sym.fh"
#include "errquit.fh"
#include "tce.fh"
      INTEGER l_a_offset
      INTEGER k_a_offset
      INTEGER size
      INTEGER length
      INTEGER addr
      INTEGER p11b
      INTEGER p14b
      INTEGER p1b
      INTEGER h13b
      length = 0
      DO p11b = noab+1,noab+nvab
      DO p14b = p11b,noab+nvab
      DO p1b = noab+1,noab+nvab
      DO h13b = 1,noab
      IF (int_mb(k_spin+p11b-1)+int_mb(k_spin+p14b-1) .eq. int_mb(k_spin
     &+h13b-1)+int_mb(k_spin+p1b-1)) THEN
      IF (ieor(int_mb(k_sym+p11b-1),ieor(int_mb(k_sym+p14b-1),ieor(int_m
     &b(k_sym+h13b-1),int_mb(k_sym+p1b-1)))) .eq. ieor(irrep_y,ieor(irre
     &p_tr,irrep_t))) THEN
      IF ((.not.restricted).or.(int_mb(k_spin+p11b-1)+int_mb(k_spin+p14b
     &-1)+int_mb(k_spin+h13b-1)+int_mb(k_spin+p1b-1).ne.8)) THEN
      length = length + 1
      END IF
      END IF
      END IF
      END DO
      END DO
      END DO
      END DO
      IF (.not.MA_PUSH_GET(mt_int,2*length+1,'noname',l_a_offset,k_a_off
     &set)) CALL ERRQUIT('ccsdt_y_tr1_17_1',0,MA_ERR)
      int_mb(k_a_offset) = length
      addr = 0
      size = 0
      DO p11b = noab+1,noab+nvab
      DO p14b = p11b,noab+nvab
      DO p1b = noab+1,noab+nvab
      DO h13b = 1,noab
      IF (int_mb(k_spin+p11b-1)+int_mb(k_spin+p14b-1) .eq. int_mb(k_spin
     &+h13b-1)+int_mb(k_spin+p1b-1)) THEN
      IF (ieor(int_mb(k_sym+p11b-1),ieor(int_mb(k_sym+p14b-1),ieor(int_m
     &b(k_sym+h13b-1),int_mb(k_sym+p1b-1)))) .eq. ieor(irrep_y,ieor(irre
     &p_tr,irrep_t))) THEN
      IF ((.not.restricted).or.(int_mb(k_spin+p11b-1)+int_mb(k_spin+p14b
     &-1)+int_mb(k_spin+h13b-1)+int_mb(k_spin+p1b-1).ne.8)) THEN
      addr = addr + 1
      int_mb(k_a_offset+addr) = h13b - 1 + noab * (p1b - noab - 1 + nvab
     & * (p14b - noab - 1 + nvab * (p11b - noab - 1)))
      int_mb(k_a_offset+length+addr) = size
      size = size + int_mb(k_range+p11b-1) * int_mb(k_range+p14b-1) * in
     &t_mb(k_range+p1b-1) * int_mb(k_range+h13b-1)
      END IF
      END IF
      END IF
      END DO
      END DO
      END DO
      END DO
      RETURN
      END

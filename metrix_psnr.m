%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%%  FUNCTION:  metrix_psnr
%%%
%%%  INPUTS:    reference_image     - original image data 
%%%
%%%             query_image         - modified image data to be compared with
%%%                                   original image
%%%
%%%  OUTPUTS:   metrix_value        - PSNR value
%%%
%%%  CHANGES:   NONE
%%%             
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Author:    Matthew Gaubatz
%%%  Version:   1.0
%%%  Date:      01/05/2007
%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Copyright (c) 2007 Visual Communications Lab, Cornell University
%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  Permission to use, copy, modify, distribute and sell this software
%%%  and its documentation for any purpose is hereby granted without fee,
%%%  provided that the above copyright notice appear in all copies and
%%%  that both that copyright notice and this permission notice appear
%%%  in supporting documentation.  VCL makes no representations about
%%%  the suitability of this software for any purpose.
%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  DISCLAIMER:
%%%  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  The code provided hereunder is provided as is without warranty
%%%  of any kind, either express or implied, including but not limited
%%%  to the implied warranties of merchantability and fitness for a
%%%  particular purpose.  The author(s) shall in no event be liable for
%%%  any damages whatsoever including direct, indirect, incidental,
%%%  consequential, loss of business profits or special damages.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [metrix_value] = metrix_psnr(reference_image, query_image)

%%%%%%%%%%%%%%%%%%%%%%%%%%%С�����
% 111111111111111111111111 
% �����ֵ�����PSNR
% ��RGBת��Y�������м���
% Y = 0.299R+0.587G+0.114B
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  R1=reference_image(:,:,1);%��ɫ����
%  G1=reference_image(:,:,2);%��ɫ����
%  B1=reference_image(:,:,3);%��ɫ����
%  X1=0.299*R1+0.587*G1+0.114*B1;
%  
%  R2=query_image(:,:,1);%��ɫ����
%  G2=query_image(:,:,2);%��ɫ����
%  B2=query_image(:,:,3);%��ɫ����
%  X2=0.299*R2+0.587*G2+0.114*B2;
%  reference_image = double(X1); 
%  query_image = double(X2);
%%%%%%%%%%%%%%%%%%%%%%��ӽ���

%%%%%%%%%% matlab�Դ�����ת��YCbCr�Ĵ��룬¦���
%22222222222222222222222
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  if size(reference_image,3)~=1   %�ж�ͼ��ʱ���ǲ�ɫͼ������ǣ����Ϊ3������Ϊ1
%    org=rgb2ycbcr(reference_image);
%    test=rgb2ycbcr(query_image);
%    Y1=org(:,:,1);
%    Y2=test(:,:,1);
%    reference_image=double(Y1);  %����ƽ��ʱ����Ҫת��double���ͣ�����uchar���ͻᶪʧ����
%    query_image=double(Y2);
%  else              %�Ҷ�ͼ�񣬲���ת��
%      reference_image=double(X);
%      query_image=double(Y);
%  end
 %%%%%%%%%%��ӽ���
 
%%%%%%%%%%%%%%%%%%%%%ת�ɻҶ�ͼ��¦���
%333333333333333333333333333333333
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if size(reference_image,3)~=1   %�ж�ͼ��ʱ���ǲ�ɫͼ������ǣ����Ϊ3������Ϊ1
   org=rgb2gray(reference_image);
   test=rgb2gray(query_image);
   reference_image=org;
   query_image=test;
   reference_image=double(reference_image);  %����ƽ��ʱ����Ҫת��double���ͣ�����uchar���ͻᶪʧ����
   query_image=double(query_image);
 else              %�Ҷ�ͼ�񣬲���ת��
     reference_image=double(reference_image);
     query_image=double(query_image);
 end
%%%%%%%%%%¦��ӽ���

mse_value = metrix_mse( reference_image, query_image );

metrix_value = 10*log10( 255*255 / mse_value );

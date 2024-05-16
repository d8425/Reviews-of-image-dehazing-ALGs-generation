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

%%%%%%%%%%%%%%%%%%%%%%%%%%%小海添加
% 111111111111111111111111 
% 计算峰值信噪比PSNR
% 将RGB转成Y分量进行计算
% Y = 0.299R+0.587G+0.114B
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  R1=reference_image(:,:,1);%红色分量
%  G1=reference_image(:,:,2);%绿色分量
%  B1=reference_image(:,:,3);%蓝色分量
%  X1=0.299*R1+0.587*G1+0.114*B1;
%  
%  R2=query_image(:,:,1);%红色分量
%  G2=query_image(:,:,2);%绿色分量
%  B2=query_image(:,:,3);%蓝色分量
%  X2=0.299*R2+0.587*G2+0.114*B2;
%  reference_image = double(X1); 
%  query_image = double(X2);
%%%%%%%%%%%%%%%%%%%%%%添加结束

%%%%%%%%%% matlab自带函数转成YCbCr的代码，娄添加
%22222222222222222222222
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  if size(reference_image,3)~=1   %判断图像时不是彩色图，如果是，结果为3，否则为1
%    org=rgb2ycbcr(reference_image);
%    test=rgb2ycbcr(query_image);
%    Y1=org(:,:,1);
%    Y2=test(:,:,1);
%    reference_image=double(Y1);  %计算平方时候需要转成double类型，否则uchar类型会丢失数据
%    query_image=double(Y2);
%  else              %灰度图像，不用转换
%      reference_image=double(X);
%      query_image=double(Y);
%  end
 %%%%%%%%%%添加结束
 
%%%%%%%%%%%%%%%%%%%%%转成灰度图像，娄添加
%333333333333333333333333333333333
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 if size(reference_image,3)~=1   %判断图像时不是彩色图，如果是，结果为3，否则为1
   org=rgb2gray(reference_image);
   test=rgb2gray(query_image);
   reference_image=org;
   query_image=test;
   reference_image=double(reference_image);  %计算平方时候需要转成double类型，否则uchar类型会丢失数据
   query_image=double(query_image);
 else              %灰度图像，不用转换
     reference_image=double(reference_image);
     query_image=double(query_image);
 end
%%%%%%%%%%娄添加结束

mse_value = metrix_mse( reference_image, query_image );

metrix_value = 10*log10( 255*255 / mse_value );

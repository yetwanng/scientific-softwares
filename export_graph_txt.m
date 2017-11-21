path='D:\my data\实验数据\IV测试\20161108-试钙钛矿层厚度对电流影响-效果不好\';
%此处文件地址改为需要的文件夹路径

Files = dir(strcat(path,'*.txt'));
LengthFiles = length(Files);
%将每次测试不同器件的数据都画图
for i = 1:LengthFiles
    file_name=Files(i).name;
    [a,b] = textread(strcat(path,Files(i).name),'%f%f',353,'headerlines', 2);
    set(gcf,'visible','off')%设置图片弹窗为不可见
    plot(a,abs(b));
    semilogy(a,abs(b));%将y轴变量取对数
    axis([-2.5,2.0,1E-10,0.03]);%设定y轴的范围为固定的，此处设定坐标轴的语句必须置于将y轴变量取对数的语句之后 
    xlabel('Voltage(V)');% x轴名称
    ylabel('Current(A)');
    saveas(gcf,[path,strcat(file_name,'-'),'.jpg']);%输出图形到指定位置
    delete(gcf);
end
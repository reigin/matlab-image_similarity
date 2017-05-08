% look backup for log
function varargout = guiCodes(varargin)
% Last Modified by GUIDE v2.5 26-Apr-2017 23:42:26
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiCodes_OpeningFcn, ...
                   'gui_OutputFcn',  @guiCodes_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before guiCodes is made visible.
function guiCodes_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

% --- Outputs from this function are returned to the command line.
function varargout = guiCodes_OutputFcn(hObject, eventdata, handles) 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in ambil.
function z=ambil_Callback(hObject, eventdata, handles)
[filename, pathname] = uigetfile({'*.*';'*.bmp';'*.jpg';'*.gif'}, 'Pick an Image File');
img=imread([pathname,filename]);

set(handles.edit1,'String',[pathname,filename]);
axes(handles.img_display);
imagesc(img);
set(handles.img_display,'Visible','off');
guidata(hObject, handles);
z=strcat(pathname,filename)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
for j=1:20
    cla(handles.(['foto',num2str(j)]));
end

path = get(handles.edit1,'String');
[pathstr,name,ext]=fileparts(path);

test = calcImageFeaturesOne(path);
img=imread(path);
histogram = round(colormoment(img));
fiturDB = text_read(1,1000);
resultComp = Comparation(test, histogram, fiturDB, 'q1');

i=1;
angs = 1;
fiturGambarnya={};
nilai{1}= str2num(name);
fiturGambarnya(1) = text_read(nilai{1},nilai{1});
for k = 1000:-1:981;
    angs=angs+1;
   value = get(handles.(['checkbox',num2str(angs)]),'Value');
   if (value==1.0)
       i=i+1;
       nilai{i} = resultComp(k,1);
       fiturGambarnya(i) = text_read(resultComp(k,1),resultComp(k,1));  
   end  
end

Q2 = averages(fiturGambarnya);
Q2_fuzz=Q2(1:26);
disp(Q2_fuzz(1,1));
Q2_moment=Q2(27:107);
res_q2 = Comparation(Q2_fuzz,Q2_moment,fiturDB,'q2');
resultComp = res_q2;

ans = 0;
[pathstr,name,ext] = fileparts(path);
nilai{1} = str2num(name);
tp = 0;
t = 0;
start = nilai{1};
class1 = ceil((start+1)/100);
for i = 1000:-1:901
    gb = int2str(resultComp(i,1));
    classed = ceil((resultComp(i,1)+1)/100);
    if(classed == class1)
        t = t+1;
    end
end
    
for i = 1000:-1:981
    gb = int2str(resultComp(i,1));
    classed = ceil((resultComp(i,1)+1)/100);
    if(classed == class1)
        tp = tp+1;
    end
    gb2 = int2str(resultComp(i,2));
    img1 = imread(['/media/reigin/data1/bljr-kul/s2/Semester2/pmdm/tgs/tubes/image/',[gb,'.jpg']]);
    ans = ans + 1;
    axes(handles.(['foto',num2str(ans)]));
    imshow(img1);
    set(handles.(['ak',num2str(ans)]),'visible','on');
    set(handles.(['ak',num2str(ans)]),'String', [gb,' (', gb2,'%)']);
    set(handles.(['checkbox',num2str(ans+1)]),'visible','on');
    set(handles.pushbutton3,'visible','on');
end

recall=(t/100)*100;
precision=(tp/20)*100;
str_recall = strcat(int2str(recall),' %');
str_precision = strcat(int2str(precision),' %');
fmes = 2 * ((recall*precision)/(recall+precision));
str_fmes = strcat(num2str(round(fmes*100)/100),' %');

set(handles.prec,'String',str_precision);
set(handles.recallnya,'String',str_recall);
set(handles.fmnya,'String',str_fmes);
guidata(hObject, handles);

function res_average = averages(all_fitur)
    len_rf = length(all_fitur);
    relevance_data = str2num(char(all_fitur));
    len_db = length(relevance_data(1:len_rf));
    res_average = zeros(107,1);
    index_fitur = 1;
    while index_fitur <= 107
        index_db = 1;
        while len_db >= index_db   % loop all db image
            res_average(index_fitur) = res_average(index_fitur)+relevance_data(index_db,index_fitur);
            index_db = index_db +1;
        end
        res_average(index_fitur) = round(res_average(index_fitur)/len_db);
        index_fitur = index_fitur +1;
    end

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)

function checkbox3_Callback(hObject, eventdata, handles)

function checkbox4_Callback(~, eventdata, handles)

function checkbox5_Callback(hObject, eventdata, handles)

function checkbox6_Callback(hObject, eventdata, handles)

function checkbox7_Callback(hObject, eventdata, handles)

function checkbox8_Callback(hObject, eventdata, handles)

function checkbox9_Callback(hObject, eventdata, handles)

function checkbox10_Callback(hObject, eventdata, handles)

function checkbox11_Callback(hObject, eventdata, handles)

function checkbox12_Callback(hObject, eventdata, handles)

function checkbox13_Callback(hObject, eventdata, handles)

function checkbox14_Callback(hObject, eventdata, handles)

function checkbox15_Callback(hObject, eventdata, handles)

function checkbox16_Callback(hObject, eventdata, handles)

function checkbox17_Callback(hObject, eventdata, handles)

function checkbox18_Callback(hObject, eventdata, handles)

function checkbox19_Callback(hObject, eventdata, handles)

function checkbox20_Callback(hObject, eventdata, handles)

function checkbox21_Callback(hObject, eventdata, handles)

function ceksim_Callback(hObject, eventdata, handles)
path = get(handles.edit1,'String');
test = calcImageFeaturesOne(path);
img = imread(path);
histogram = round(colormoment(img));
fiturDB = text_read(1,1000);
resultComp = Comparation(test, histogram, fiturDB,'q1');

ans = 0;
[pathstr,name,ext] = fileparts(path);
nilai{1} = str2num(name);
tp = 0;
t = 0;
start = nilai{1};
class1 = ceil((start+1)/100);
for i = 1000:-1:901
    gb = int2str(resultComp(i,1));
    classed = ceil((resultComp(i,1)+1)/100);
    if(classed == class1)
        t = t+1;
    end
end
    
for i = 1000:-1:981
    gb = int2str(resultComp(i,1));
    classed = ceil((resultComp(i,1)+1)/100);
    if(classed == class1)
        tp = tp+1;
    end
    gb2 = int2str(resultComp(i,2));
    img1 = imread(['/media/reigin/data1/bljr-kul/s2/Semester2/pmdm/tgs/tubes/image/',[gb,'.jpg']]);
    ans = ans + 1;
    axes(handles.(['foto',num2str(ans)]));
    imshow(img1);
    set(handles.(['ak',num2str(ans)]),'visible','on');
    set(handles.(['ak',num2str(ans)]),'String', [gb,' (', gb2,'%)']);
    set(handles.(['checkbox',num2str(ans+1)]),'visible','on');
    set(handles.pushbutton3,'visible','on');
end

recall=(t/100)*100;
precision=(tp/20)*100;
str_recall = strcat(int2str(recall),' %');
str_precision = strcat(int2str(precision),' %');
fmes = 2 * ((recall*precision)/(recall+precision));
str_fmes = strcat(num2str(round(fmes*100)/100),' %');

set(handles.prec,'String',str_precision);
set(handles.recallnya,'String',str_recall);
set(handles.fmnya,'String',str_fmes);

guidata(hObject, handles);

% function res_average = averages(all_fitur)
%     len_rf = length(all_fitur);
%     relevance_data = str2num(char(all_fitur));
%     len_db = length(relevance_data(1:len_rf));
%     res_average = zeros(107,1);
%     index_fitur = 1;
%     while index_fitur <= 107
%         index_db = 1;
%         while len_db >= index_db   % loop all db image
%             res_average(index_fitur) = res_average(index_fitur)+relevance_data(index_db,index_fitur);
%             index_db = index_db +1;
%         end
%         res_average(index_fitur) = round(res_average(index_fitur)/len_db);
%         index_fitur = index_fitur +1;
%     end

% --- Executes on button press in cekIni.
function cekIni_Callback(hObject, eventdata, handles)

function hasil = calcImageFeaturesOne(imgPath)
    proses = rateSplitImage(imgPath);
    hasil = CountFitur(proses);

function result = rateSplitImage(path)
    rgbImage = imread(path);
    length_bounding_box=39;
    [rows columns numberOfColorBands] = size(rgbImage);
    xrows = round(rows / 40);
    xcolumns = round(columns/ 40);

    n = 0;
    for i = 0: length_bounding_box
        for j = 0: length_bounding_box
            n = n+1;
            bounding_box{n} = [(i*xcolumns)+1 (j*xrows)+1 (xcolumns) (xrows)];
            cropped_image{n} = imcrop(rgbImage,bounding_box{n}) ;    
        end
    end

    for i_rgb = 1:1600
        if ~isempty(cropped_image{i_rgb})                   % not include empty cropped image ~ cz fixed slice
            redChannel = cropped_image{i_rgb}(:, :, 1);
            greenChannel = cropped_image{i_rgb}(:, :, 2);
            blueChannel = cropped_image{i_rgb}(:, :, 3);

            redrate{i_rgb} = round(sum(redChannel(:))/numel(redChannel));
            greenrate1{i_rgb} = round(sum(greenChannel(:))/numel(greenChannel));
            bluerate1{i_rgb} = round(sum(blueChannel(:))/numel(blueChannel));

            result{i_rgb} = fuzzyH(redrate{i_rgb},greenrate1{i_rgb},bluerate1{i_rgb});
        end
    end

function someVar = CountFitur(x)
    y={'b';'w';'g';'dr';'do';'dy';'dgr';'dc';'dbl';'dm';'lr';'lo';'ly';'lgr';'lc';'lbl';'lm';'mr';'mo';'my';'mgr';'mc';'mbl';'mm'};
    for k=1:numel(y)
        resultFitur(k) = 0;
        for m=1:numel(x)
             if(strcmp(x(m),y(k)))
                 resultFitur(k) = resultFitur(k)+1;
             end
        end
        strs{k} = num2str(resultFitur(k));
    end
    someVar = strcat(strs,',');
    
function resultF = fuzzyH(R,G,B)
    v = max(int64([R,G,B]));
    m = min(int64([R,G,B]));
    s = 255-((255*min(int64([R,G,B])))/v);
    
    if((v-m)==0)
        selisih_rgb = 1;
    else
        selisih_rgb = v-m;
    end
    
    if(R==v && G<B)
        h=(60*(G-B))/(selisih_rgb);
    elseif(R==v && G>=B)
        h=(359+(60*(G-B)))/(selisih_rgb);
        if(h>360)
            h=h-360;
        end
    elseif(G==v)
        h=((119+(60*(B-R)))/selisih_rgb);
    elseif(B==v)
        h=(60*(G-B))/(selisih_rgb);
    end
    h=abs(h);

    % H Channel Distribution
    % ((0,0,5,10),(5,10,35,50), (35,50,70,85), (70,85,150,165), (150,165,195,205),(195,205,265,280), (265,280,315,330), 
    % (315,330,360,360))
    % ro, o, y, g, c, b, m, br #red to orange, orange, yellow, green, cyan, blue, magenta, and blue to red.
    if(h>=0 && h<=5)
        bins8 = 'ro';
    elseif(h>=5 && h<=10)
        bins8 = HCompareChannel(h,0,0,5,10,35,50,'ro','o');
    elseif(h>=10 && h<=35)
        bins8 = 'o';
    elseif(h>=35 && h<=50)
        bins8 = HCompareChannel(h,5,10,35,50,70,85,'o','y');
    elseif(h>=50 && h<=70)
        bins8 = 'y';
    elseif(h>=70 && h<=85)
        bins8 = HCompareChannel(h,35,50,70,85,150,165,'y','g');
    elseif(h>=85 && h<=150)
       bins8 = 'g';
    elseif(h>=150 && h<=165)
        bins8 = HCompareChannel(h,70,85,150,165,195,205,'g','c');
    elseif(h>=165 && h<=195)
       bins8 = 'c';
    elseif(h>=195 && h<=205)
        bins8 = HCompareChannel(h,150,165,195,205,265,280,'c','b');
    elseif(h>=205 && h<=265)
        bins8 = 'b';
    elseif(h>=265 && h<=280)
        bins8 = HCompareChannel(h,195,205,265,280,315,330,'b','m');
    elseif(h>=280 && h<=315)
        bins8 = 'm';
    elseif(h>=315 && h<=330)
        bins8 = HCompareChannel(h,265,280,315,330,360,360,'m','br');
    elseif(h>=330 && h<=360)
        bins8 = 'br';
    else
        %disp('How can be into here?');
    end        

    % S Channel Distribution
    % ((0,0,20,110) , (20,110,255,255))     ~ HCompareChannel
    % 1 n 2
    if(s>=0 && s<=20)
        bins2 = 'satu';
    elseif(s>=20 && s<=110)
        bins2 = HCompareChannel(s,0,0,20,110,255,255,'satu','dua');
    elseif(s>=110 && s<=255)
        bins2 = 'dua';
    end

    % V Channel Distribution
    % ((0,0,50,80), (50,80,255,255),(20,110,255,255)). 
    % 1,2,3
    % v = 30; % test here
    if(v>=0 && v<=50)
        bins3 = 'satu';
    elseif(v>=80 && v<=110)
        bins3 = 'dua';
    elseif(v>=110 && v<=255)
        bins3 = 'tiga';
    elseif(v>=50 && v<=255)
        bins3 = VCompareChannel(v,0,0,50,80,20,110,255,255,'satu','dua','tiga');
    end

    filter10 = judging10(bins8,bins2,bins3);

    % ((0,0,50,138) , (50,138,255,255))
    % SnV Channel Distribution 24bins
    % 1 n 2
    if(s<=50 && s>=0)
        Sbins24 = 'satu';
    elseif(s<=255 && s>=138)
        Sbins24 = 'dua';
    elseif(s<=138 && s>=50)
        Sbins24 = HCompareChannel(s,0,0,50,138,255,255,'satu','dua');
    end
    if(v<=50 && v>=0)
        Vbins24 = 'satu';
    elseif(v<=255 && v>=138)
        Vbins24 = 'dua';
    elseif(v<=138 && v>=50)
        Vbins24 = HCompareChannel(s,0,0,50,138,255,255,'satu','dua');
    end

    if(strcmp(filter10,'black') || strcmp(filter10,'white') || strcmp(filter10,'gray'))
        resultF = filter10;
    else
        if(strcmp(filter10,'br') || strcmp(filter10,'ro'))
            filter10 = 'r';
        elseif(strcmp(filter10,'g'))
            filter10 = 'gr';
        elseif(strcmp(filter10,'b'))
            filter10 = 'bl';
        end
        resultF = judging24(filter10,Sbins24,Vbins24);
    end

function res10 = judging10(h,s,v)
    if(strcmp(v,'satu'))
        res10 = 'b';
    elseif(strcmp(v,'dua') && strcmp(s,'satu'))
        res10 = 'w';
    elseif(strcmp(v,'tiga') && strcmp(s,'satu'))
        res10 = 'g';
    elseif((strcmp(v,'dua') || strcmp(v,'tiga')) && strcmp(s,'dua'))
        res10 = h;
    else
        %disp('error judge 10');
    end
    
function Hbins = HCompareChannel(h,x0,x1,x2,x3,x4,x5,s1,s2)
    newH1 = HCalculationMethod(h,x0,x1,x2,x3);  % vector perpotongan kiri
    newH2 = HCalculationMethod(h,x2,x3,x4,x5);  % vector perpotongan kanan
    if(newH1>newH2)
        Hbins = s1;
    else
        Hbins = s2;
    end
    
function y = HCalculationMethod(h,x0,x1,x2,x3)
    if (h<=x1 && h>=x0)
        y = (h-x0)/(x1-x0);
    elseif(h<=x3 && h>=x2)
        y = 1+((h-x2)/(x2-x3));
    else
        y = 0;
    end
    
function res24 = judging24(h,s,v)
    if(strcmp(v,'satu'))
        res24 = strcat('d',h);
    elseif(strcmp(v,'dua') && strcmp(s,'satu'))
        res24 = strcat('l',h);
    elseif(strcmp(v,'dua') && strcmp(s,'dua'))
        res24 = strcat('m',h);
    else
        disp('error judge 24');
    end
    
function Vbins = VCompareChannel(h,x0,x1,x2,x3,x4,x5,x6,x7,s1,s2,s3)
    newV1 = HCalculationMethod(h,x0,x1,x2,x3);  % vector perpotongan kiri
    newV2 = HCalculationMethod(h,x2,x3,x6,x7);  % vector perpotongan kanan
    newV3 = HCalculationMethod(h,x4,x5,x6,x7);  % vector perpotongan kanan
    if(newV1>=newV2 && newV1>=newV3)
        Vbins = s1;
    elseif(newV2>=newV1 && newV2>=newV3)
        Vbins = s2;
    elseif(newV3>=newV1 && newV3>=newV1)
        Vbins = s3;
    else
        Vbins = 'error';
    end
    
function resComp = Comparation(resFuz, resMom, FiturDB,tipe)     % start 3~24, start 25~108
    if(strcmp(tipe,'q1'))
        resFuz_ = str2num(char(resFuz));
    else
        resFuz_ = resFuz;
    end
    
    FiturDB_ = str2num(char(FiturDB));
    len_db = length(FiturDB_(1:1000));
    index_db = 1;   
    similarity = zeros(1000,1);
    zz = zeros(1000,1);
    concat=zeros(1000,2);
    treshold = 20;
    
    while len_db >= index_db   % loop all db image
        index_fitur = 3;  % test use 24 max fuzzy
        
        while index_fitur <= 26       % fuzzy check
            selisih = abs(FiturDB_(index_db,index_fitur) - resFuz_(index_fitur-2,1));
            zz(index_db) = index_db;
            FiturDB_(index_db);
            if(selisih <= treshold)
                similarity(index_db) = similarity(index_db) + 1;
            else
%                 disp(FiturDB_(index_db,index_fitur));
            end
            index_fitur = index_fitur + 1;
        end
        while (index_fitur < 108) && (index_fitur > 26)     % momento check
            if(strcmp(tipe,'q1'))
                selisih = abs(FiturDB_(index_db,index_fitur) - resMom(1,index_fitur-26));
            else    
                selisih = abs(FiturDB_(index_db,index_fitur) - resMom(index_fitur-26));
            end
            
            if(selisih <= treshold)
                similarity(index_db) = similarity(index_db) + 1;    % max = 105 
            end
            index_fitur = index_fitur + 1;
        end
        similarity(index_db) = round((similarity(index_db) / 105)*100);
        index_db = index_db + 1;
%       index_db = 1001;
    end
    concat = cat(2,zz,similarity);
    concat = sortrows(concat,2);
    resComp = concat;

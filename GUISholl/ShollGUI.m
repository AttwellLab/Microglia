function varargout = ShollGUI(varargin)
% SHOLLGUI MATLAB code for ShollGUI.fig
%      SHOLLGUI, by itself, creates a new SHOLLGUI or raises the existing
%      singleton*.
%
%      H = SHOLLGUI returns the handle to a new SHOLLGUI or the handle to
%      the existing singleton*.
%
%      SHOLLGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SHOLLGUI.M with the given input arguments.
%
%      SHOLLGUI('Property','Value',...) creates a new SHOLLGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ShollGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ShollGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ShollGUI

% Last Modified by GUIDE v2.5 24-Nov-2017 11:37:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ShollGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ShollGUI_OutputFcn, ...
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


% --- Executes just before ShollGUI is made visible.

function ShollGUI_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ShollGUI (see VARARGIN)

% Choose default command line output for ShollGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes ShollGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ShollGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1




% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function XYRes_Callback(hObject, eventdata, handles)
% hObject    handle to XYRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of XYRes as text
%        str2double(get(hObject,'String')) returns contents of XYRes as a double


% --- Executes during object creation, after setting all properties.
function XYRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to XYRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ZRes_Callback(hObject, eventdata, handles)
% hObject    handle to ZRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ZRes as text
%        str2double(get(hObject,'String')) returns contents of ZRes as a double


% --- Executes during object creation, after setting all properties.
function ZRes_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ZRes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function header_Callback(hObject, eventdata, handles)
% hObject    handle to header (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of header as text
%        str2double(get(hObject,'String')) returns contents of header as a double


% --- Executes during object creation, after setting all properties.
function header_CreateFcn(hObject, eventdata, handles)
% hObject    handle to header (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function Somabox_Callback(hObject, eventdata, handles)
% hObject    handle to Somabox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Somabox as text
%        str2double(get(hObject,'String')) returns contents of Somabox as a double


% --- Executes during object creation, after setting all properties.
function Somabox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Somabox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function SRbox_Callback(hObject, eventdata, handles)
% hObject    handle to SRbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of SRbox as text
%        str2double(get(hObject,'String')) returns contents of SRbox as a double


% --- Executes during object creation, after setting all properties.
function SRbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to SRbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function MRbox_Callback(hObject, eventdata, handles)
% hObject    handle to MRbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of MRbox as text
%        str2double(get(hObject,'String')) returns contents of MRbox as a double


% --- Executes during object creation, after setting all properties.
function MRbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to MRbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global par
uiopen('*.mat')
par=parsaved;
handles.Somabox.String=par.Soma;
handles.SRbox.String=par.SR;
handles.MRbox.String=par.MR;
handles.XYRes.String=par.XYResolution;
handles.ZRes.String=par.ZResolution;
handles.header.String=par.header;
handles.popupmenu1.Value=par.micronconverted;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
par.Soma = str2double(handles.Somabox.String);
par.SR = str2double(handles.SRbox.String);
par.MR = str2double(handles.MRbox.String);
par.XYResolution = str2double(handles.XYRes.String);
par.ZResolution = str2double(handles.ZRes.String);
par.header = handles.header.String;
par.micronconverted = handles.popupmenu1.Value;
parsaved=par;
uisave('parsaved','savedparameters')



% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
par.Soma=str2double(handles.Somabox.String);
par.SR=str2double(handles.SRbox.String);
par.MR=str2double(handles.MRbox.String);
par.XYResolution = str2double(handles.XYRes.String);
par.ZResolution = str2double(handles.ZRes.String);
par.headerlinesIn=str2double(handles.header.String);
path=uigetdir;
str=cellstr(handles.popupmenu1.String);
val=handles.popupmenu1.Value;
switch str{val}
    case 'Yes'
        ShollAnalysis(path, par, par.headerlinesIn)
        [Int] = PoolData(path,path,par);
    case 'No'
        [path2,headerlines2] = MicronConvert(path, par);
        ShollAnalysis(path2, par, headerlines2);
        [Int] = PoolData(path, path2, par);
end
gr=handles.checkbox1.Value;
switch gr
    case 1
        y=mean(Int(:,2:end),2);
        n=size(Int(:,2:end),2);
        er=std(Int(:,2:end),0,2)/sqrt(n);
        figure
        errorbar(Int(:,1),y,er,'o-k')
        ylabel('Intersections','FontSize',16);
        xlabel('Distance from Soma (µm)','FontSize',16)
end

disp('complete')


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

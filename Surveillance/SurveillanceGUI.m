function varargout = SurveillanceGUI(varargin)
% SURVEILLANCEGUI MATLAB code for SurveillanceGUI.fig
%      SURVEILLANCEGUI, by itself, creates a new SURVEILLANCEGUI or raises the existing
%      singleton*.
%
%      H = SURVEILLANCEGUI returns the handle to a new SURVEILLANCEGUI or the handle to
%      the existing singleton*.
%
%      SURVEILLANCEGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SURVEILLANCEGUI.M with the given input arguments.
%
%      SURVEILLANCEGUI('Property','Value',...) creates a new SURVEILLANCEGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SurveillanceGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SurveillanceGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SurveillanceGUI

% Last Modified by GUIDE v2.5 27-Nov-2017 14:46:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SurveillanceGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @SurveillanceGUI_OutputFcn, ...
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


% --- Executes just before SurveillanceGUI is made visible.
function SurveillanceGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SurveillanceGUI (see VARARGIN)

% Choose default command line output for SurveillanceGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SurveillanceGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = SurveillanceGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function timeminbox_Callback(hObject, eventdata, handles)
% hObject    handle to timeminbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeminbox as text
%        str2double(get(hObject,'String')) returns contents of timeminbox as a double


% --- Executes during object creation, after setting all properties.
function timeminbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeminbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function timemaxbox_Callback(hObject, eventdata, handles)
% hObject    handle to timemaxbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timemaxbox as text
%        str2double(get(hObject,'String')) returns contents of timemaxbox as a double


% --- Executes during object creation, after setting all properties.
function timemaxbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timemaxbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function baseminbox_Callback(hObject, eventdata, handles)
% hObject    handle to baseminbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of baseminbox as text
%        str2double(get(hObject,'String')) returns contents of baseminbox as a double


% --- Executes during object creation, after setting all properties.
function baseminbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to baseminbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function basemaxbox_Callback(hObject, eventdata, handles)
% hObject    handle to basemaxbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of basemaxbox as text
%        str2double(get(hObject,'String')) returns contents of basemaxbox as a double


% --- Executes during object creation, after setting all properties.
function basemaxbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to basemaxbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function nbox_Callback(hObject, eventdata, handles)
% hObject    handle to nbox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nbox as text
%        str2double(get(hObject,'String')) returns contents of nbox as a double


% --- Executes during object creation, after setting all properties.
function nbox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nbox (see GCBO)
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
disp('running...')
path=uigetdir;
timeline = (str2double(handles.timeminbox.String)+1:str2double(handles.timemaxbox.String)+1);
baseline = (str2double(handles.baseminbox.String)+1:str2double(handles.basemaxbox.String)+1);
ncells = str2double(handles.nbox.String);
Surveillance(path, timeline, baseline, ncells)
disp('complete')

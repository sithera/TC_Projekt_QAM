function varargout = wykresy(varargin)
% WYKRESY MATLAB code for wykresy.fig
%      WYKRESY, by itself, creates a new WYKRESY or raises the existing
%      singleton*.
%
%      H = WYKRESY returns the handle to a new WYKRESY or the handle to
%      the existing singleton*.
%
%      WYKRESY('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WYKRESY.M with the given input arguments.
%
%      WYKRESY('Property','Value',...) creates a new WYKRESY or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before wykresy_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to wykresy_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help wykresy

% Last Modified by GUIDE v2.5 27-May-2014 00:44:41

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @wykresy_OpeningFcn, ...
    'gui_OutputFcn',  @wykresy_OutputFcn, ...
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

% --- Executes just before wykresy is made visible.
function wykresy_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to wykresy (see VARARGIN)

% Choose default command line output for wykresy
handles.output = hObject;
axes(handles.axes1);
S = getappdata(0,'S');
max_freq = getappdata(0,'max_freq');
plot(S)
grid off
xlabel('Frequency [Hz]')
ylabel('Amplitude')
title('16-QAM Modulated Signal')
axis([0 max_freq -5 5 ])   %skala

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using wykresy.


% UIWAIT makes wykresy wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = wykresy_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
cla;
S = getappdata(0,'S');
SS = getappdata(0,'SS');
Sodt = getappdata(0,'Sodt');
max_freq = getappdata(0,'max_freq');

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        plot(S)
        grid off
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        title('16-QAM Modulated Signal')
        axis([0 max_freq -5 5 ])   %skala
    case 2
        plot(SS)
        grid off
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        title('16-QAM Modulated Signal')
        axis([0 max_freq -5 5 ])   %skala
    case 3
        plot(Sodt)
        grid off
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        title('16-QAM Modulated Signal')
        axis([0 max_freq -5 5 ])   %skala
    case 4
        k=4;
        Eb_N0_dB  = [0:15];
        theoryBer = (1/k)*3/2*erfc(sqrt(k*0.1*(10.^(Eb_N0_dB/10))));
        semilogy(Eb_N0_dB,theoryBer,'bs-','LineWidth',2);
        hold on
        %semilogy(Eb_N0_dB,ber,'mx-','LineWidth',2);
        axis([0 15 10^-6 1])
        grid on
        legend('theory');
        xlabel('Eb/No [dB]')
        ylabel('Bit Error Rate')
        title('Bit error probability curve for 16-QAM modulation')
        hold off
end


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


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

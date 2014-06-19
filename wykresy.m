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

data = getappdata(0,'bit_array');
grid off;
stairs(data)
axis([0 20 -2 2 ])
title('Input Data')
xlabel('Data Index')
ylabel('Value')   %skala

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

axes(handles.axes1);
cla;

ber_sim = getappdata(0,'ber_sim');
wart = getappdata(0,'wart');
data = getappdata(0,'bit_array');

popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 6
        grid off
        S = getappdata(0,'S');
        plot(S);
        xlabel('Frequency [Hz]');
        ylabel('Amplitude');
        title('16-QAM Modulated Signal');
        axis([0 1200 -10 10 ]) ;  %skala
    case 7
        grid off
        SS = getappdata(0,'SS');
        plot(SS);
        xlabel('Frequency [Hz]');
        ylabel('Amplitude');
        title('16-QAM Modulated Signal + Noise');
        axis([0 1200 -10 10 ])   %skala
        
    case 15
        k=log2(wart);
        EbNodB=1:15;
        EbNo=10.^(EbNodB/10);
        M=2^k;
        x=sqrt(3*k*EbNo/(M-1));
        Pb=(4/k)*(1-1/sqrt(M))*(1/2)*erfc(x/sqrt(2));
        semilogy(EbNodB,Pb,'bs-','LineWidth',2);
        hold on
        semilogy(EbNodB,ber_sim,'r*','LineWidth',2);
        grid on
        axis([0 15 10^-6 1]);
        legend('theory', 'simulation');
        xlabel('Eb/No, dB');
        ylabel('Bit Error Rate');
        title(['Bit error probability curve for ' num2str(wart) '-QAM modulation']);
        hold off
    case 16
        setappdata(0,'wykres',handles.axes1);
        BER();
    case 17
        setappdata(0,'wykres',handles.axes1);
        diagram_kons(wart);
    case 1
        stairs(data)
        axis([0 20 -2 2 ])
        title('Input Data')
        xlabel('Data Index')
        ylabel('Value')
    case 2
        I = getappdata(0,'I');
        stairs(I,'red')
        axis([0 20 -8 8 ])
        title('I after "Serial to paraler conver"')
        xlabel('Data Index')
        ylabel('Value')
    case 3
        Q = getappdata(0,'Q');
        stairs(Q,'red')
        axis([0 20 -8 8 ])
        title('Q after "Serial to paraler convert"')
        xlabel('Data Index')
        ylabel('Value')
    case 4
        s11 = getappdata(0,'s11');
        plot(s11)
        axis([0 1200 -10 10 ])
        title('I after "D/A converter" * cos')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
    case 5
        s12 = getappdata(0,'s12');
        plot(s12)
        axis([0 1200 -10 10 ])
        title('Q after "D/A converter" * sin')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
    case 8
        Scos = getappdata(0,'Scos');
        plot(Scos);
        axis([0 1200 -10 10 ])
        title('Recived signal * cos (I)')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
    case 9
        BI = getappdata(0,'BI');
        plot(BI);
        axis([0 1200 -10 10 ])
        title('Recived signal * cos (I) after low-pass filter')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        
    case 10
        Ssin = getappdata(0,'Ssin');
        plot(Ssin);
        axis([0 1200 -10 10 ])
        title('Recived signal * sin (Q)')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        
    case 11
        BQ = getappdata(0,'BQ');
        plot(BQ);
        axis([0 1200 -10 10 ])
        title('Recived signal * sin (Q) after low-pass filter')
        xlabel('Frequency [Hz]')
        ylabel('Amplitude')
        
    case 12
        Id = getappdata(0,'Id');
        stairs(Id,'red');
        axis([0 20 -8 8 ])
        title('I after "A/D converter"')
        xlabel('Data Index')
        ylabel('Value')
        
    case 13
        Qd = getappdata(0,'Qd');
        stairs(Qd,'red');
        axis([0 20 -8 8 ])
        title('Q after "A/D converter"')
        xlabel('Data Index')
        ylabel('Value')
        
    case 14
        dataWyj = getappdata(0,'dataWyj');
        stairs(dataWyj);
        axis([0 20 -2 2 ])
        title('Output Data')
        xlabel('Data Index')
        ylabel('Value')
        
        
        
        
end

guidata(hObject,handles);

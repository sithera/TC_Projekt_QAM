function varargout = strtobit(varargin)
% STRTOBIT MATLAB code for strtobit.fig
%      STRTOBIT, by itself, creates a new STRTOBIT or raises the existing
%      singleton*.
%
%      H = STRTOBIT returns the handle to a new STRTOBIT or the handle to
%      the existing singleton*.
%
%      STRTOBIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in STRTOBIT.M with the given input arguments.
%
%      STRTOBIT('Property','Value',...) creates a new STRTOBIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before strtobit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to strtobit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help strtobit

% Last Modified by GUIDE v2.5 12-Apr-2014 13:29:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @strtobit_OpeningFcn, ...
                   'gui_OutputFcn',  @strtobit_OutputFcn, ...
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


% --- Executes just before strtobit is made visible.
function strtobit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to strtobit (see VARARGIN)

% Choose default command line output for strtobit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes strtobit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = strtobit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in wprowadz_tekst.
function wprowadz_tekst_Callback(hObject, eventdata, handles)
% hObject    handle to wprowadz_tekst (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
bit_array = string_input;

stem(bit_array,'filled');
set(gca,'YTick', [0:1], 'XLim', [0 size(bit_array,2)], 'YLim', [0 1]);
set(gca,'XGrid', 'on');
axis([0 size(bit_array,2) 0 1]);



% --- Executes on button press in random_bits.
function random_bits_Callback(hObject, eventdata, handles)
% hObject    handle to random_bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.bits);

bit = bit_generate;
stem(bit,'filled');
set(gca,'XTick', [1:length(bit)], 'YTick', [0:1], 'XLim', [1 length(bit)], 'YLim', [0 1]);
set(gca,'XGrid', 'on');
axis([0 length(bit) 0 1]);

% Update handles structure
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function bits_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bits (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set(gca,'XTick', [1:16], 'YTick', [0:1], 'XLim', [1 24], 'YLim', [0 1]);
axis([0 16 0 1]);




% Hint: place code in OpeningFcn to populate bits

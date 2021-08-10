function MalariaCM121Jun20211010261000127 = importfile(filename, dataLines)
%IMPORTFILE Import data from a text file
%  MALARIACM121JUN20211010261000127 = IMPORTFILE(FILENAME) reads data
%  from text file FILENAME for the default selection.  Returns the data
%  as a table.
%
%  MALARIACM121JUN20211010261000127 = IMPORTFILE(FILE, DATALINES) reads
%  data for the specified row interval(s) of text file FILENAME. Specify
%  DATALINES as a positive scalar integer or a N-by-2 array of positive
%  scalar integers for dis-contiguous row intervals.
%
%  Example:
%  MalariaCM121Jun20211010261000127 = importfile("D:\ITU\21062021\data\CM1\Malaria_CM1_21Jun2021101026_1000_127.9_13.0_1000x.csv", [2, Inf]);
%
%  See also READTABLE.
%
% Auto-generated by MATLAB on 24-Jun-2021 10:57:18

%% Input handling

% If dataLines is not specified, define defaults
if nargin < 2
    dataLines = [2, Inf];
end

%% Setup the Import Options
opts = delimitedTextImportOptions("NumVariables", 7);

% Specify range and delimiter
opts.DataLines = dataLines;
opts.Delimiter = [",", ";"];

% Specify column names and types
opts.VariableNames = ["a1", "Var2", "Var3", "a3_2", "a3_3", "a3_4", "VarName7"];
opts.SelectedVariableNames = ["a1", "a3_2", "a3_3", "a3_4", "VarName7"];
opts.VariableTypes = ["string", "string", "string", "double", "double", "double", "double"];
opts = setvaropts(opts, [1, 2, 3], "WhitespaceRule", "preserve");
opts = setvaropts(opts, [1, 2, 3], "EmptyFieldRule", "auto");
opts.ExtraColumnsRule = "ignore";
opts.EmptyLineRule = "read";

% Import the data
MalariaCM121Jun20211010261000127 = readtable(filename, opts);

end
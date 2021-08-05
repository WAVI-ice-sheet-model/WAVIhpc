using WAVI
format = "mat"
output_file_path = "./"
ncoutname = "./outfile.nc"
prefix = "outfile"
WAVI.make_ncfile(format, output_file_path, ncoutname, prefix)


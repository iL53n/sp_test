# README

### About
The application for parsing web logs and preparing reports (2 types in one output).

### Run program
```bash
bin/parse [file_path]

Options:
  -h, --help         Display help menu.
```
*type something like `chmod +x bin/` if you have `Permission denied` problem

### Usage
```bash
bin/parse 'data/webserver.log'
```

### Supported log format
```log
/help_page/1 126.318.035.038
/contact 184.123.665.067
/home 184.123.665.067
```

### Available report (two kinds in one output)

 * TYPE 1 (list of webpages with most page views ordered from most pages views to less page views)
 * TYPE 2 (list of webpages with most unique page views also ordered)
```
first 3 visits
/second 2 visits
/pages/1 1 visits
/first 2 unique views
/pages/1 1 unique views
/second 1 unique views
```

### Run tests
```bash
rspec spec
```
*with key `-fd` if documentation format

### Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

### License
[MIT](https://choosealicense.com/licenses/mit/)
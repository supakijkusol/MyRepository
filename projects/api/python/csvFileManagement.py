class csvFileManagement:

    def reqresin_readCSVFile(self, filePath, fileName):
        try:
            with open(filePath + '\\' + fileName, encoding='utf-8') as csvfile:
                lines = csvfile.readlines()
                print(lines)
                return lines
        except IOError as err:
            print(err)

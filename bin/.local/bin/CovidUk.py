import os

cases = os.system("CovidUk")
casesIntoString = str(cases)
desired_lines = casesIntoString[4:].split("\\n")
print(desired_lines)

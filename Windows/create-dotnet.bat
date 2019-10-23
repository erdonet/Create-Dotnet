@echo off
SET MyProjectName=Erdonet







echo ---------------------------------------------------------
echo Your Project Name (cancel ctrl+c) : %MyProjectName%
echo ---------------------------------------------------------
pause

mkdir %MyProjectName%

echo ---------------------------------------------------------
echo Create Project Folders
echo ---------------------------------------------------------
cd %MyProjectName%
mkdir build
mkdir docs
mkdir design
cd design
mkdir html
mkdir templates
cd ..
mkdir packages
mkdir lib
mkdir src
mkdir tests

echo ---------------------------------------------------------
echo Create Solution File
echo ---------------------------------------------------------
dotnet new sln -n %MyProjectName%


cd src
echo ---------------------------------------------------------
echo Create Library Projects
echo ---------------------------------------------------------
dotnet new classlib -n %MyProjectName% -f netstandard2.1
dotnet new classlib -n %MyProjectName%.Core -f netstandard2.1
dotnet new web -n %MyProjectName%.WebUI -f netcoreapp3.0
dotnet new web -n %MyProjectName%.WebAdminUI -f netcoreapp3.0
dotnet new webapi -n %MyProjectName%.WebApi -f netcoreapp3.0
dotnet new webapi -n %MyProjectName%.WebAdminApi -f netcoreapp3.0
cd ..
cd tests
echo ---------------------------------------------------------
echo Create Test Projects
echo ---------------------------------------------------------
dotnet new console -n %MyProjectName%.Test.ConsoleApp -f netcoreapp3.0
dotnet new mstest -n %MyProjectName%.Test.UnitTest -f netcoreapp3.0
cd ..

echo ---------------------------------------------------------
echo Projects Add to Solution
echo ---------------------------------------------------------
dotnet sln %MyProjectName%.sln add src/%MyProjectName%/%MyProjectName%.csproj
dotnet sln %MyProjectName%.sln add src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet sln %MyProjectName%.sln add src/%MyProjectName%.WebUI/%MyProjectName%.WebUI.csproj
dotnet sln %MyProjectName%.sln add src/%MyProjectName%.WebAdminUI/%MyProjectName%.WebAdminUI.csproj
dotnet sln %MyProjectName%.sln add src/%MyProjectName%.WebApi/%MyProjectName%.WebApi.csproj
dotnet sln %MyProjectName%.sln add src/%MyProjectName%.WebAdminApi/%MyProjectName%.WebAdminApi.csproj

dotnet sln %MyProjectName%.sln add tests/%MyProjectName%.Test.ConsoleApp/%MyProjectName%.Test.ConsoleApp.csproj
dotnet sln %MyProjectName%.sln add tests/%MyProjectName%.Test.UnitTest/%MyProjectName%.Test.UnitTest.csproj

echo ---------------------------------------------------------
echo Add References
echo ---------------------------------------------------------
echo --- Add Reference 'Core Library' To 'Main Library' Projects
dotnet add src/%MyProjectName%/%MyProjectName%.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add src/%MyProjectName%.WebUI/%MyProjectName%.WebUI.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add src/%MyProjectName%.WebUI/%MyProjectName%.WebUI.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add src/%MyProjectName%.WebAdminUI/%MyProjectName%.WebAdminUI.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add src/%MyProjectName%.WebAdminUI/%MyProjectName%.WebAdminUI.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add src/%MyProjectName%.WebApi/%MyProjectName%.WebApi.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add src/%MyProjectName%.WebApi/%MyProjectName%.WebApi.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add src/%MyProjectName%.WebAdminApi/%MyProjectName%.WebAdminApi.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add src/%MyProjectName%.WebAdminApi/%MyProjectName%.WebAdminApi.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add tests/%MyProjectName%.Test.ConsoleApp/%MyProjectName%.Test.ConsoleApp.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add tests/%MyProjectName%.Test.ConsoleApp/%MyProjectName%.Test.ConsoleApp.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj

dotnet add tests/%MyProjectName%.Test.UnitTest/%MyProjectName%.Test.UnitTest.csproj reference src/%MyProjectName%/%MyProjectName%.csproj
dotnet add tests/%MyProjectName%.Test.UnitTest/%MyProjectName%.Test.UnitTest.csproj reference src/%MyProjectName%.Core/%MyProjectName%.Core.csproj


echo ---------------------------------------------------------
echo Add Nuget Packages
echo ---------------------------------------------------------
echo --- Add EntityFrameworkCore.SqlServer
dotnet add src/%MyProjectName%.Core/%MyProjectName%.Core.csproj package Microsoft.EntityFrameworkCore.SqlServer --version 3.0.0 --package-directory packages

echo dotnet add src/%MyProjectName%.Core/%MyProjectName%.Core.csproj package Microsoft.EntityFrameworkCore.MySql --version 3.0.0 --package-directory packages
echo dotnet add src/%MyProjectName%.Core/%MyProjectName%.Core.csproj package Microsoft.EntityFrameworkCore.Sqlite --version 3.0.0 --package-directory packages
echo dotnet add src/%MyProjectName%.Core/%MyProjectName%.Core.csproj package Dapper --version 2.0.30 --package-directory packages


echo ---------------------------------------------------------
echo Create .gitignore file
echo ---------------------------------------------------------
echo ## Visit https://www.gitignore.io/api/csharp ## > .gitignore

echo ---------------------------------------------------------
echo Create Markdown files
echo ---------------------------------------------------------
cd build
echo ## Build files ## > README.md
cd ..

cd docs
echo ## Project Documentation ## > README.md
cd ..

cd design
echo ## Design Files ## > README.md

cd html
echo ## Html Files ## > README.md
cd ..

cd templates
echo ## Template Files ## > README.md
cd ..

cd ..

cd packages
echo ## Nuget Packages ## > README.md
cd ..

cd lib
echo ## Without Nuget Packages ## > README.md
cd ..

cd src
echo ## Project Files ## > README.md

cd %MyProjectName%
echo ## %MyProjectName% ## > README.md
cd ..

cd %MyProjectName%.Core
echo ## %MyProjectName%.Core ## > README.md
cd ..

cd %MyProjectName%.WebUI
echo ## %MyProjectName%.WebUI ## > README.md
cd ..

cd %MyProjectName%.WebAdminUI
echo ## %MyProjectName%.WebAdminUI ## > README.md
cd ..

cd %MyProjectName%.WebApi
echo ## %MyProjectName%.WebApi ## > README.md
cd ..

cd %MyProjectName%.WebAdminApi
echo ## %MyProjectName%.WebAdminApi ## > README.md
cd ..

cd ..


cd tests
echo ##Test Projects ## > README.md

cd %MyProjectName%.Test.ConsoleApp
echo ## %MyProjectName%.Test.ConsoleApp ## > README.md
cd..

cd %MyProjectName%.Test.UnitTest
echo ## %MyProjectName%.Test.UnitTest ## > README.md
cd ..
cd ..

echo ## %MyProjectName% Project ## > README.md

cd ..


echo ---------------------------------------------------------
echo ********************* COMPLETED *************************
echo ---------------------------------------------------------
pause
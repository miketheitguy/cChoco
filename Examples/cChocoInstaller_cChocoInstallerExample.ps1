﻿# Copyright (c) 2017 Chocolatey Software, Inc.
# Copyright (c) 2013 - 2017 Lawrence Gripper & original authors/contributors from https://github.com/chocolatey/cChoco
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

Configuration InstallChoco
{
    Import-DscResource -Module cChoco  
    Node "localhost"
    {
        cChocoInstaller InstallChoco
        {
            InstallDir = "c:\choco"
        }
        cChocoPackageInstaller installSkypeWithChocoParams
        {
            Name                 = 'skype'
            Ensure               = 'Present'
            DependsOn            = '[cChocoInstaller]installChoco'
        }
    }
} 

$config = InstallChoco

Start-DscConfiguration -Path $config.psparentpath -Wait -Verbose -Force
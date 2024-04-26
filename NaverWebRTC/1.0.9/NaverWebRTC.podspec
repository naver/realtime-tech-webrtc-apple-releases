Pod::Spec.new do |spec|
    spec.name         = "NaverWebRTC"
    spec.version      = "1.0.9"
    spec.summary      = "WebRTC pre-compiled library for apple platforms"
    spec.homepage     = "https://github.com/naver/realtime-tech-webrtc-apple-releases"
    spec.license      = { :type => 'BSD', :text => <<-LICENSE
    WebRTC for NAVER
    Copyright (c) 2023-present NAVER Corp.
    The 3-Clause BSD License

    Redistribution and use in source and binary forms, with or without modification, 
    are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright notice, this list 
       of conditions and the following disclaimer.

    2. Redistributions in binary form must reproduce the above copyright notice, this 
       list of conditions and the following disclaimer in the documentation and/or other 
       materials provided with the distribution.

    3. Neither the name of the copyright holder nor the names of its contributors may 
       be used to endorse or promote products derived from this software without 
       specific prior written permission.

    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND 
    CONTRIBUTORS “AS IS” AND ANY EXPRESS OR IMPLIED WARRANTIES, 
    INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
    MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
    DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR 
    CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
    EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED 
    TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, 
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON 
    ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR 
    TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
    THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
    DAMAGE.


    This project contains subcomponents with separate copyright notices and license terms. 
    Your use of the source code for these subcomponents is subject to the terms and conditions of the following licenses.

    =====

    WebRTC
    https://webrtc.googlesource.com/src


    Copyright (c) 2011, The WebRTC project authors. All rights reserved.
    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are
    met:
      * Redistributions of source code must retain the above copyright
        notice, this list of conditions and the following disclaimer.
      * Redistributions in binary form must reproduce the above copyright
        notice, this list of conditions and the following disclaimer in
        the documentation and/or other materials provided with the
        distribution.
      * Neither the name of Google nor the names of its contributors may
        be used to endorse or promote products derived from this software
        without specific prior written permission.
    THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
    "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
    LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
    A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
    HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
    SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
    LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
    DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
    THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
    OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

    =====
    LICENSE
  }
    spec.author       = "Naver Corporation"
    spec.ios.deployment_target = '14.0'
    spec.osx.deployment_target = '11.0'
    spec.source       = { :http => "https://github.com/naver/realtime-tech-webrtc-apple-releases/releases/download/1.0.9/WebRTC.xcframework.zip" }
    spec.vendored_frameworks = "WebRTC.xcframework"
end
# SectorProgressView

<img src="https://cloud.githubusercontent.com/assets/2233158/11992145/31074214-aa5d-11e5-9aab-3d52bff451fe.gif" width="402" height="708" />

## Useage

Use SectorProgressView in storyboard/xib or create an instance from code:

```
let progressView = SectorProgressView(frame:CGRectMake(0, 0, 100, 100))
progressView.progress = 0.5
progressView.setProgress(1.0, animated:true)
```

options to set:

```
progressView.fillColor = UIColor(red: 0.0, green: 0, blue: 0, alpha: 0.8)
progressView.circleBorderWidth = 4.0
progressView.radius = 20.0
progressView.animationDuration = 1.0
```

## License

The MIT License (MIT)

Copyright © 2015 Shi Xu. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

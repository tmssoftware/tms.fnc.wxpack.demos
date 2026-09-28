object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'TMSFNCWXContainer - Demo'
  ClientHeight = 950
  ClientWidth = 1443
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 816
    Width = 1443
    Height = 134
    Align = alBottom
    TabOrder = 0
    object ImageIndex: TLabel
      AlignWithMargins = True
      Left = 689
      Top = 24
      Width = 72
      Height = 32
      Alignment = taCenter
      Caption = 'Slide 1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Previous: TButton
      Left = 8
      Top = 6
      Width = 147
      Height = 67
      Caption = 'Previous'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = PreviousClick
    end
    object Next: TButton
      Left = 1288
      Top = 6
      Width = 147
      Height = 67
      Caption = 'Next'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = NextClick
    end
  end
  object TMSFNCWXContainer1: TTMSFNCWXContainer
    Left = 0
    Top = 0
    Width = 1443
    Height = 816
    Align = alClient
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 1
    Links = <
      item
        URL = 
          'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.' +
          'min.css'
        Rel = 'stylesheet'
        Defer = False
        Async = False
        Kind = mlkLink
      end
      item
        URL = 
          'https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.b' +
          'undle.min.js'
        Defer = False
        Async = False
        Kind = mlkScript
      end
      item
        URL = 'https://code.jquery.com/jquery-3.6.0.min.js'
        Defer = False
        Async = False
        Kind = mlkScript
      end
      item
        URL = 
          'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/al' +
          'l.min.css'
        Rel = 'stylesheet'
        Defer = False
        Async = False
        Kind = mlkLink
      end
      item
        Content.Strings = (
          'body {'
          'display: flex;'
          'flex-direction: column;'
          '}')
        Defer = False
        Async = False
        Kind = mlkStyle
      end
      item
        URL = 
          'https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min' +
          '.js'
        Defer = True
        Async = False
        Kind = mlkScript
      end
      item
        URL = 
          'https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.11.0/mdb.min' +
          '.css'
        Rel = 'stylesheet'
        Defer = False
        Async = False
        Kind = mlkLink
      end
      item
        URL = 
          'https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&d' +
          'isplay=swap'
        Rel = 'stylesheet'
        Defer = False
        Async = False
        Kind = mlkLink
      end>
    ElementContainers = <
      item
        HTML.Strings = (
          ''
          '<nav class="navbar navbar-dark bg-dark">'
          '  <div class="container-fluid">'
          
            '    <button class="navbar-toggler ms-auto" type="button" data-md' +
            'b-toggle="collapse"'
          
            '      data-mdb-target="#navbarToggleExternalContent3" aria-contr' +
            'ols="navbarToggleExternalContent3"'
          '      aria-expanded="false" aria-label="Toggle navigation">'
          '      <i class="fas fa-bars"></i>'
          '    </button>'
          '  </div>'
          '</nav>'
          '<div class="collapse" id="navbarToggleExternalContent3">'
          '  <div class="bg-light shadow-3 p-4">'
          
            '    <button class="btn btn-link btn-block border-bottom m-0" id=' +
            '"loadimg">Load Image</button>'
          
            '    <button class="btn btn-link btn-block border-bottom m-0" id=' +
            '"cycle">Start/Pause cycling</button>'
          '     </div>'
          '</div>'
          '')
        Actions = <
          item
            HTMLElementID = 'loadimg'
            Name = 'Action0'
            OnExecute = TMSFNCWXContainer1ElementContainers0Actions0Execute
          end
          item
            HTMLElementID = 'cycle'
            Name = 'Action1'
            OnExecute = TMSFNCWXContainer1ElementContainers0Actions1Execute
          end>
        Position = poCustom
        HTMLElementID = 'ElementContainer0'
        UseDefaultStyle = False
        Style.Strings = (
          '#ElementContainer0{'
          'top: 0;'
          'left:0;'
          'right: 0;'
          'width: 100%;'
          'z-index: 9999999;'
          ''
          '}')
      end
      item
        HTML.Strings = (
          
            '<div id="carouselExampleCaptions" class="carousel slide" data-bs' +
            '-ride="carousel">'
          '  <div class="carousel-inner">'
          '    <div class="carousel-item active">'
          
            '      <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%2' +
            '0(15).webp" class="d-block w-100" alt="...">'
          '      <div class="carousel-caption d-none d-md-block">'
          '        </div>'
          '    </div>'
          '    <div class="carousel-item">'
          
            '      <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%2' +
            '0(22).webp" class="d-block w-100" alt="...">'
          '      <div class="carousel-caption d-none d-md-block">'
          '      </div>'
          '    </div>'
          '    <div class="carousel-item">'
          
            '      <img src="https://mdbcdn.b-cdn.net/img/Photos/Slides/img%2' +
            '0(23).webp" class="d-block w-100" alt="...">'
          '      <div class="carousel-caption d-none d-md-block">'
          '       </div>'
          '    </div>'
          '  </div>'
          '</div>'
          '')
        Actions = <>
        Position = poCustom
        HTMLElementID = 'ElementContainer1'
        UseDefaultStyle = False
        Style.Strings = (
          '#ElementContainer1{'
          'overflow: hidden;'
          'height: 100vh;'
          'left: 0;'
          'right: 0;'
          'position: relative;'
          ''
          '}'
          '.carousel {'
          'overflow:hidden;'
          '}'
          ''
          'img {'
          'object-fit: scale-down;'
          'height:100vh;'
          '}'
          '')
        Script.Strings = (
          'function InitCarousel() {'
          '  debugger;'
          
            '  $('#39'#carouselExampleCaptions'#39').on('#39'slide.bs.carousel'#39', function' +
            ' (a) {'
          '    CallBack('#39'CarouselSlide'#39', a);'
          '  });'
          '}'
          'function AddImage(image){'
          
            ' $('#39'<div class="carousel-item"><img src="'#39'+image+'#39'" class="d-blo' +
            'ck w-100"><div class="carousel-caption"></div>   </div>'#39').append' +
            'To('#39'.carousel-inner'#39');'
          
            '    $('#39'<li data-target="#carousel-example-generic" data-slide-to' +
            '="'#39'+i+'#39'"></li>'#39').appendTo('#39'.carousel-indicators'#39')'
          '}')
      end>
    OnControlInitialized = TMSFNCWXContainer1ControlInitialized
    OnCustomEvent = TMSFNCWXContainer1CustomEvent
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Image|*.jpg;*.jpeg;*.png;'
    Left = 296
    Top = 864
  end
end

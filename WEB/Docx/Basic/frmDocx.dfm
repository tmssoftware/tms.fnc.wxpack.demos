object Form1: TForm1
  Width = 1033
  Height = 887
  object WebPageControl1: TWebPageControl
    Left = 0
    Top = 0
    Width = 1033
    Height = 887
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    HeightPercent = 100.000000000000000000
    WidthPercent = 100.000000000000000000
    Align = alClient
    ChildOrder = 5
    TabIndex = 0
    TabOrder = 1
    object WebPageControl1Sheet1: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1033
      Height = 867
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Basic'
      object Basic: TWebButton
        Left = 0
        Top = 837
        Width = 1033
        Height = 30
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alBottom
        Caption = 'Generate a basic document using this code'
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = BasicClick
      end
      object WebMemo2: TWebMemo
        Left = 0
        Top = 0
        Width = 1033
        Height = 837
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        Lines.Strings = (
          'procedure TForm1.BasicClick(Sender: TObject);'
          'var'
          '  section: TTMSFNCWXDocxSection;'
          '  paragraph:  TTMSFNCWXDocxParagraph;'
          '  text: TTMSFNCWXDocxText;'
          'begin'
          '  TMSFNCWXDocx1.Document.Sections.Clear;'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.AddParagraph;'
          '  text := paragraph.AddText('#39'Hello world'#39');'
          '  text.Font.Color := gcRed;'
          ''
          '  TMSFNCWXDocx1.GetDocxAsFile('#39'BasicDocx.docx'#39');'
          'end;')
        SelLength = 0
        SelStart = 421
        WidthPercent = 100.000000000000000000
      end
    end
    object WebPageControl1Sheet2: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1033
      Height = 867
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Intermediate'
      ChildOrder = 1
      object InterMediate: TWebButton
        Left = 0
        Top = 837
        Width = 1033
        Height = 30
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alBottom
        Caption = 'Generate a intermediate document using this code'
        ChildOrder = 1
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = InterMediateClick
      end
      object WebMemo1: TWebMemo
        Left = 0
        Top = 0
        Width = 1033
        Height = 837
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        Lines.Strings = (
          
            'procedure TForm1.GenerateIntermediateDocument(FileName, Title: S' +
            'tring);'
          'var'
          '  section: TTMSFNCWXDocxSection;'
          '  paragraph:  TTMSFNCWXDocxParagraph;'
          '  table: TTMSFNCWXDocxTable;'
          '  tableCell: TTMSFNCWXDocxTableCell;'
          '  TableRow: TTMSFNCWXDocxTableRow;'
          '  i, j: Integer;'
          'begin'
          '  TMSFNCWXDocx1.Document.Sections.Clear;'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  section.Page.Orientation := poLandscape;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Heading := hlTitle;'
          '  paragraph.AddText(Title);'
          '  paragraph.Alignment := taCenter;'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.AddText('#39'Hello World - table'#39');'
          '  paragraph.Heading := hlHeading1;'
          '  paragraph.Alignment := taCenter;'
          '  table := section.AddTable;'
          ''
          '  for i := 0 to 3 do'
          '  begin'
          '    tableRow := Table.AddRow;'
          '    for j := 0 to 3 do'
          '    begin'
          '      tableCell := tableRow.AddCell;'
          '      paragraph := TableCell.AddParagraph;'
          
            '      paragraph.AddText('#39'row '#39' + IntToStr(i) + '#39' cell '#39' + IntToS' +
            'tr(j));'
          '    end;'
          '  end;'
          ''
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Heading := hlHeading2;'
          '  paragraph.Alignment := taRight;'
          '  paragraph.AddText('#39'image'#39');'
          '  paragraph := section.AddParagraph;'
          '  (paragraph.AddImage).Bitmap.LoadFromResource(Logo);'
          '  TMSFNCWXDocx1.GetDocxAsFile(fileName);'
          'end;')
        SelLength = 0
        SelStart = 1389
        WidthPercent = 100.000000000000000000
      end
    end
    object WebPageControl1Sheet3: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1033
      Height = 867
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Advanced'
      ChildOrder = 2
      object Advanced: TWebButton
        Left = 0
        Top = 837
        Width = 1033
        Height = 30
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alBottom
        Caption = 'Generate an advanced document using this code'
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = AdvancedClick
      end
      object WebMemo3: TWebMemo
        Left = 0
        Top = 0
        Width = 1033
        Height = 837
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        Lines.Strings = (
          'procedure TForm1.AdvancedClick(Sender: TObject);'
          'var'
          '  section: TTMSFNCWXDocxSection;'
          '  paragraph:  TTMSFNCWXDocxParagraph;'
          '  text: TTMSFNCWXDocxText;'
          '  table: TTMSFNCWXDocxTable;'
          '  tableCell: TTMSFNCWXDocxTableCell;'
          '  TableRow: TTMSFNCWXDocxTableRow;'
          '  i, j: Integer;'
          '  toc: TTMSFNCWXDocxTableOfContents;'
          '  internalHyperlink: TTMSFNCWXDocxInternalHyperLink;'
          '  externalHyperlink: TTMSFNCWXDocxExternalHyperlink;'
          '  s: string;'
          'begin'
          '  FMulti := false;'
          '  TMSFNCWXDocx1.Document.Sections.Clear;'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  section.Page.Orientation := poLandscape;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Heading := hlTitle;'
          '  paragraph.Alignment := taCenter;'
          
            '  paragraph.AddBookmark('#39'titleBookmark'#39', '#39'Demo: A docx.js Story'#39 +
            ');'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  toc := section.AddTableOfContents;'
          '  toc.Hyperlink := true;'
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.AddText('#39'Hello World - table'#39');'
          '  paragraph.Heading := hlHeading1;'
          '  paragraph.Alignment := taCenter;'
          '  table := section.AddTable;'
          ''
          '  for i := 0 to 3 do'
          '  begin'
          '    tableRow := Table.AddRow;'
          '    for j := 0 to 3 do'
          '    begin'
          '      tableCell := tableRow.AddCell;'
          '      paragraph := TableCell.AddParagraph;'
          
            '      paragraph.AddText('#39'row '#39' + IntToStr(i) + '#39' cell '#39' + IntToS' +
            'tr(j));'
          '    end;'
          '  end;'
          ''
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.Footers.DefaultFooter.AddParagraph;'
          '  paragraph.AddPageNumber;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Heading := hlHeading2;'
          '  paragraph.Alignment := taRight;'
          '  paragraph.AddText('#39'Image'#39');'
          '  paragraph := section.AddParagraph;'
          '  (paragraph.AddImage).Bitmap.LoadFromResource(Logo);'
          ''
          '  paragraph := section.AddParagraph;'
          '  paragraph.Heading := hlHeading2;'
          '  paragraph.Alignment := taRight;'
          '  text := paragraph.AddText('#39'Some random text'#39');'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Alignment := taLeft;'
          '  paragraph.AddText('#39'lorem ipsum and something else.'#39');'
          '  text.Font.Color := gcAquamarine;'
          '  paragraph.AddText('#39'lorem ipsum and something else.'#39');'
          '  text.Font.Style := [TFontStyle.fsUnderline];'
          '  text.Underline.UnderlineType := utDouble;'
          '  paragraph.AddText('#39'lorem ipsum and something else.'#39');'
          '  paragraph.AddText('#39'lorem ipsum and something else.'#39');'
          ''
          '  section := TMSFNCWXDocx1.Document.AddSection;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 0;'
          '  text := paragraph.AddText;'
          '  text.Text := '#39'bullet point level 0'#39';'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 1;'
          '  text := paragraph.AddText;'
          '  text.Text := '#39'bullet point level 1'#39';'
          '  text.Font.Color := gcRed;'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 2;'
          '  text := paragraph.AddText;'
          '  text.Text := '#39'bullet point level 2'#39';'
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 3;'
          '  text := paragraph.AddText;'
          '  text.Text := '#39'bullet point level 3'#39';'
          ''
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 0;'
          '  internalHyperlink := paragraph.AddInternalHyperlink;'
          '  internalHyperlink.Anchor := '#39'titleBookmark'#39';'
          '  text := internalHyperlink.AddText;'
          '  text.Text := '#39'link to title'#39';'
          ''
          '  paragraph := section.AddParagraph;'
          '  paragraph.Bullet.Level := 0;'
          '  externalHyperlink := paragraph.AddExternalHyperlink;'
          '  externalHyperlink.Link := '#39'https://www.tmssoftware.com'#39';'
          '  text := externalHyperlink.AddText;'
          '  text.Text := '#39'link to tmssoftware page'#39';'
          ''
          '  TMSFNCWXDocx1.GetDocxAsFile('#39'AdvancedDocx.docx'#39');'
          'end;')
        SelLength = 0
        SelStart = 3574
        WidthPercent = 100.000000000000000000
      end
    end
    object WebPageControl1Sheet4: TWebTabSheet
      Left = 0
      Top = 20
      Width = 1033
      Height = 867
      Margins.Left = 2
      Margins.Top = 2
      Margins.Right = 2
      Margins.Bottom = 2
      HeightPercent = 100.000000000000000000
      WidthPercent = 100.000000000000000000
      Caption = 'Multiple documents'
      ChildOrder = 3
      object Multi: TWebButton
        Left = 0
        Top = 837
        Width = 1033
        Height = 30
        Margins.Left = 1
        Margins.Top = 1
        Margins.Right = 1
        Margins.Bottom = 1
        Align = alBottom
        Caption = 'Generate 10 intermediate documents using this code'
        ChildOrder = 2
        HeightPercent = 100.000000000000000000
        WidthPercent = 100.000000000000000000
        OnClick = MultiClick
      end
      object WebMemo4: TWebMemo
        Left = 0
        Top = 0
        Width = 1033
        Height = 837
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        AutoSize = False
        HeightPercent = 100.000000000000000000
        Lines.Strings = (
          'procedure TForm1.MultiClick(Sender: TObject);'
          'var'
          '  i: Integer;'
          'begin'
          '  FMulti := true;'
          '  for I := 0 to 9 do'
          '  begin'
          
            '    GenerateIntermediateDocument('#39'intermediateDocx'#39' + IntToStr(i' +
            ') + '#39'.Docx'#39', '#39'My Document'#39' + IntToStr(i));'
          '  end;'
          ''
          'end;')
        SelLength = 0
        SelStart = 248
        WidthPercent = 100.000000000000000000
      end
    end
  end
  object TMSFNCWXDocx1: TTMSFNCWXDocx
    Left = 3
    Top = 37
    Width = 26
    Height = 26
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    ParentDoubleBuffered = False
    DoubleBuffered = True
    TabOrder = 0
    Visible = True
    OnDownloadAsFile = TMSFNCWXDocx1DownloadFile
  end
end

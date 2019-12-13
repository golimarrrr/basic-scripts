// these 2 nested loops copy cells from a JXL workbook (reading values and some format like font size and background color) to a POI workbook (writing those values and format)

jxl.Sheet shtSrc = myJxlSheet;
if (shtSrc != null) {
	Sheet shtDst = wbkPoi.createSheet("newSheet");
	for (int nRow = 0; nRow < shtSrc.getRows(); nRow++) {
		jxl.Cell[] rowSrc = shtSrc.getRow(nRow);
		Row rowDst = shtDst.createRow(nRow);
		for (int nCol = 0; nCol < rowSrc.length; nCol++) {
			Cell cellDst = rowDst.createCell(nCol);
			String cellSrcContents = rowSrc[nCol].getContents();
			cellDst.setCellValue(cellSrcContents);
			int cellDstBoldWeight = rowSrc[nCol].getCellFormat().getFont().getBoldWeight();
			int cellDstFontSize = rowSrc[nCol].getCellFormat().getFont().getPointSize();
			Colour cellSrcBackgroundColor = rowSrc[nCol].getCellFormat().getBackgroundColour();
			XSSFCellStyle cellDstStyle = (XSSFCellStyle) wbkPoi.createCellStyle();
			java.awt.Color cellColor = new java.awt.Color(
				cellSrcBackgroundColor.getDefaultRGB().getRed(),
				cellSrcBackgroundColor.getDefaultRGB().getGreen(),
				cellSrcBackgroundColor.getDefaultRGB().getBlue()
			);
			cellDstStyle.setFillForegroundColor(new XSSFColor(cellColor));
			cellDstStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			XSSFFont cellFont = (XSSFFont) wbkPoi.createFont();
			cellFont.setFontHeight(cellDstFontSize);
			cellFont.setBold(cellDstBoldWeight >= 700);		// 400 = normal, 700 = bold
			cellDstStyle.setFont(cellFont);
			cellDst.setCellStyle(cellDstStyle);
		}
	}
}

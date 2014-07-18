App.EmberTableSimpleController = Ember.Controller.extend
  numRows: 100

  columns: Ember.computed ->
    dateColumn = Ember.Table.ColumnDefinition.create
      columnWidth: 150
      textAlign: 'text-align-left'
      headerCellName: 'Date'
      getCellContent: (row) -> row.get('date').toDateString();
    openColumn = Ember.Table.ColumnDefinition.create
      columnWidth: 100
      headerCellName: 'Open'
      getCellContent: (row) -> row.get('open').toFixed(2)
      compareCellValues: (firstRow, secondRow) -> firstRow.open - secondRow.open
    highColumn = Ember.Table.ColumnDefinition.create
      columnWidth: 100
      headerCellName: 'High'
      getCellContent: (row) -> row.get('high').toFixed(2)
      compareCellValues: (firstRow, secondRow) -> firstRow.high - secondRow.high
    lowColumn = Ember.Table.ColumnDefinition.create
      columnWidth: 100
      headerCellName: 'Low'
      getCellContent: (row) -> row.get('low').toFixed(2)
      compareCellValues: (firstRow, secondRow) -> firstRow.low - secondRow.low
    closeColumn = Ember.Table.ColumnDefinition.create
      columnWidth: 100
      headerCellName: 'Close'
      getCellContent: (row) -> row.get('close').toFixed(2)
      compareCellValues: (firstRow, secondRow) -> firstRow.close - secondRow.close
    [dateColumn, openColumn, highColumn, lowColumn, closeColumn]

  content: Ember.computed ->
    [0...@get('numRows')].map (index) ->
      date = new Date()
      date.setDate(date.getDate() + index)
      date:  date
      open:  Math.random() * 100 - 50
      high:  Math.random() * 100 - 50
      low:   Math.random() * 100 - 50
      close: Math.random() * 100 - 50
      volume: Math.random() * 1000000
  .property 'numRows'

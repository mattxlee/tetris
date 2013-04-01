﻿package  {		public class TrAbstractBlocks implements ITrBlocks {				private var shapes:Array;		private var indexOfShapes:Number;		private var i:Number;		private var j:Number;		private var gameData:ITrGameData;		public function TrAbstractBlocks() {						// constructor code			shapes = new Array;			indexOfShapes = -1;						i = j = 0;		}				public function setGameData(aGameData:ITrGameData):void {			gameData = aGameData;		}				public function reset():void {			j = 0;			i = Math.floor(gameData.getCol() / 2 - getNumOfCols() / 2);		}				public function setI(aI:Number):void {			i = aI;		}				public function getI():Number {			return i;		}				public function getJ():Number {			return j;		}				public function IncI():void {			++i;		}				public function DecI():void {			--i;		}				public function IncJ():void {			++j;		}				public function getNumOfColsOfShape(index:Number):Number {			return shapes[index][0].length;		}				public function getNumOfRowsOfShape(index:Number):Number {			return shapes[index].length;		}				public function getValueOfShape(i:Number, j:Number, index:Number):Number {			return shapes[index][j][i];		}				public function getNumOfCols():Number {			return getNumOfColsOfShape(indexOfShapes);		}				public function getNumOfRows():Number {			return getNumOfRowsOfShape(indexOfShapes);		}				public function getValue(i:Number, j:Number):Number {			return getValueOfShape(i, j, indexOfShapes);		}				public function turnLeft():void {			++indexOfShapes;			if (indexOfShapes >= shapes.length) {				indexOfShapes = 0;			}		}				public function turnRight():void {			--indexOfShapes;			if (indexOfShapes < 0) {				indexOfShapes = shapes.length - 1;			}		}				public function getNextIndexOfShape():Number {			var nextIndex:int = indexOfShapes - 1;			if (nextIndex < 0) nextIndex = shapes.length - 1;			return nextIndex;		}				public function isBlockingOnNextTurn(i:Number, j:Number):Boolean {			var index:Number = getNextIndexOfShape();			return isBlockingOfShape(i, j, index);		}				public function isBlockingOfShape(i:Number, j:Number, index:Number):Boolean {			if (i < 0) return true;			if (i + getNumOfColsOfShape(index) > gameData.getCol()) return true;			if (j + getNumOfRowsOfShape(index) > gameData.getRow()) return true;						for (var ii:int = 0; ii < getNumOfColsOfShape(index); ++ii)				for (var jj:int = 0; jj < getNumOfRowsOfShape(index); ++jj)					if (getValueOfShape(ii, jj, index) != 0 && gameData.getValue(i + ii, j + jj) != 999 && gameData.getValue(i + ii, j + jj) > 100) return true;								return false;		}				public function isBlocking(i:Number, j:Number):Boolean {			return isBlockingOfShape(i, j, indexOfShapes);		}				public function removeFromGameData():void {			for (var ii:int = 0; ii < getNumOfCols(); ++ii)				for (var jj:int = 0; jj < getNumOfRows(); ++jj)					if (getValue(ii, jj) > 0) gameData.setValue(i + ii, j + jj, 0);		}				public function applyToGameData():void {			for (var ii:int = 0; ii < getNumOfCols(); ++ii)				for (var jj:int = 0; jj < getNumOfRows(); ++jj)					if (getValue(ii, jj) > 0) gameData.setValue(i + ii, j + jj, getValue(ii, jj));					}				public function findBlockJ():Number {			var currJ:Number = j;			while (!isBlocking(i, currJ + 1)) {				++currJ;			}			return currJ;		}				public function applyShadowToGameData():void {			// find the bottm place			var currJ:Number = findBlockJ();						// now add shadow			for (var ii:int = 0; ii < getNumOfCols(); ++ii)				for (var jj:int = 0; jj < getNumOfRows(); ++jj)					if (getValue(ii, jj) > 0) gameData.setValue(i + ii, currJ + jj, 999);		}				public function removeShadowFromGameData():void {			var currJ:Number = findBlockJ();						// remove shadow			for (var ii:int = 0; ii < getNumOfCols(); ++ii)				for (var jj:int = 0; jj < getNumOfRows(); ++jj)					if (getValue(ii, jj) > 0) gameData.setValue(i + ii, currJ + jj, 0);		}				public function stableToGameData():void {			for (var ii:int = 0; ii < getNumOfCols(); ++ii)				for (var jj:int = 0; jj < getNumOfRows(); ++jj)					if (getValue(ii, jj) > 0) gameData.setValue(i + ii, j + jj, getValue(ii, jj) + 100);		}				protected function addShape(shape:Array):void {			shapes.push(shape);						// first shape, now the index set to 0, otherelse the index should be -1			if (shapes.length == 1) indexOfShapes = 0;		}	}	}
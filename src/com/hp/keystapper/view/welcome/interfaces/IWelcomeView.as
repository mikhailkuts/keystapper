/*
 * User: mikhailkuts
 * Date: 17.03.13
 */
package com.hp.keystapper.view.welcome.interfaces {
public interface IWelcomeView {
	function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void;

	function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void;

	function init():void;
}
}

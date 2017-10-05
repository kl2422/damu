package com.shsxt.danmu.exception;

import com.shsxt.danmu.constant.Constant;

/**
 * Created by TW on 2017/9/29.
 */
public class ParamException extends RuntimeException {

    private int errorCode;

    public ParamException(int errorCode, String message) {
        super(message);
        this.errorCode = errorCode;
    }

    public ParamException(String message) {
        super(message);
        this.errorCode = Constant.FAILED_CODE;
    }

    public ParamException() {
        super(Constant.FAILED_MSG);
        this.errorCode = Constant.FAILED_CODE;
    }

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }
}

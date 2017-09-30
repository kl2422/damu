package com.shsxt.danmu.util;

import java.util.ArrayList;
import java.util.Collection;

@SuppressWarnings("serial")
public class PageList<E> extends ArrayList<E> {
    private Paginator paginator;

    public PageList() {
    }

    public PageList(Collection<? extends E> c) {
        super(c);
    }

    public PageList(Collection<? extends E> c, Paginator p) {
        super(c);
        this.paginator = p;
    }

    public PageList(Paginator p) {
        this.paginator = p;
    }

    public Paginator getPaginator() {
        return this.paginator;
    }
}

package com.shsxt.danmu.vo;

/**
 * Created by TW on 2017/9/27.
 */
public class TagVo {
    private String tag;
    private boolean selected;

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TagVo tagVo = (TagVo) o;

        return tag != null ? tag.equals(tagVo.tag) : tagVo.tag == null;
    }
}

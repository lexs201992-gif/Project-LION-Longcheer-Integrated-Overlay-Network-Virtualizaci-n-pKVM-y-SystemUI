package com.longcheer.sidebar.ui.view;
import androidx.recyclerview.widget.RecyclerView;
import android.view.WindowManager$LayoutParams;
import com.longcheer.sidebar.ui.view.SidebarPanelView$onPanelChangeListener;
import java.util.List;
import com.longcheer.sidebar.ui.adapter.SidebarPanelAdapter;
import com.longcheer.sidebar.data.SidebarShortcutInfo;
import android.graphics.Rect;
import android.content.res.Configuration;
import android.view.View;
import android.view.WindowManager;
import android.animation.ValueAnimator;
import android.view.MotionEvent;
import android.view.KeyEvent;
import android.widget.ImageButton;
import com.longcheer.sidebar.utils.Position;
import android.view.WindowMetrics;
import android.content.Context;

public class SidebarPanelView extends FrameLayout
{
/*
 * Field Definitions.
 */
      private int MIN_WINDOW_Y;
      private final RecyclerView body;
      private final ImageButton footer;
      private final ImageButton header;
      private boolean isDragEnd;
      private boolean isShowing;
      private final Context mContext;
      private WindowManager$LayoutParams mCurrentLayoutParams;
      private int mDisplayHeight;
      private int mDisplayWidth;
      private int mDownX;
      private int mDownY;
      private final ValueAnimator mDragAnimator;
      private int mHorizontalMinTop;
      private int mIconWidth;
      private boolean mIsDragging;
      private int mItemPadding;
      private final Configuration mLastConfiguration;
      private int mMargin;
      private SidebarPanelView$onPanelChangeListener mOnPanelChangeListener;
      private final View mPanel;
      private int mPanelHeaderHeight;
      private int mPanelPadding;
      private final Position mPosition;
      private int mRelativeToPointerDownX;
      private int mRelativeToPointerDownY;
      private int mSafeInset;
      private double mSquareScaledTouchSlop;
      private final WindowManager mWindowManager;
      private final List shortcuts;
      private final SidebarPanelAdapter sidebarPanelAdapter;
/*
 * Declared Constructors.
 */
    public SidebarPanelView(Context, List, Position) { ... }
    public static void $r8$lambda$5rJAFX0CwEXIbiB521p9Td2f__E(SidebarPanelView) { ... }
    public static void $r8$lambda$CqxWugVvOPrgYzZyKEpmOrtga5A(SidebarPanelView, Context, View) { ... }
    public static void $r8$lambda$OiMbzB8MJ3QEKHLGrHLK8p8ib5o(SidebarPanelView, int, int, ValueAnimator) { ... }
    public static boolean $r8$lambda$qRnDzDXWLTbhK_YXL3LjKB90KHM(SidebarPanelView, View, MotionEvent) { ... }
    public static void $r8$lambda$uuBBHjy5MfTlSyTElKvMQY6uedE(SidebarPanelView, View, SidebarShortcutInfo) { ... }
    static volatile SidebarPanelView$onPanelChangeListener -$$Nest$fgetmOnPanelChangeListener(SidebarPanelView) { ... }
    static volatile Position -$$Nest$fgetmPosition(SidebarPanelView) { ... }
    static volatile void -$$Nest$fputisDragEnd(SidebarPanelView, boolean) { ... }
    static volatile float -$$Nest$mcalculateCurrentPercentageY(SidebarPanelView) { ... }
    static volatile float -$$Nest$mtransformCurrentPercentageXToEdge(SidebarPanelView) { ... }
    static volatile void -$$Nest$mupdateLocationWith(SidebarPanelView, Position) { ... }
    private float calculateCurrentPercentageX() { ... }
    private float calculateCurrentPercentageY() { ... }
    private boolean checkCollision(int, int, int, int) { ... }
    private void configurationChanged(Configuration) { ... }
    public static int constrain(int, int, int) { ... }
    private boolean contains(int, int, int, int) { ... }
    private WindowManager$LayoutParams createDefaultLayoutParams() { ... }
    public boolean dispatchKeyEvent(KeyEvent) { ... }
    private void execTools(SidebarShortcutInfo) { ... }
    public int getMaxWindowX() { ... }
    private int getMaxWindowY() { ... }
    public int getMinWindowX() { ... }
    private int getMinWindowY() { ... }
    private int getNavigationBarHeight() { ... }
    private int getPanelHeight() { ... }
    private int getPanelWidth() { ... }
    private int getSafeInset(Configuration, boolean) { ... }
    public Rect getViewBounds(View) { ... }
    public int getWindowHeight() { ... }
    private int getWindowWidth() { ... }
    private void handleHome() { ... }
    private void handleRecentCalls() { ... }
    private void handleScreenRecord() { ... }
    private void handleScreenshot() { ... }
    private void handleSwitchToLastApp() { ... }
    private boolean hasExceededTouchSlop(int, int, int, int) { ... }
    public void hide() { ... }
    public boolean isShowing() { ... }
    private void lambda$execTools$3() { ... }
    private void lambda$new$0(Context, View) { ... }
    private void lambda$new$1(View, SidebarShortcutInfo) { ... }
    private boolean lambda$new$2(View, MotionEvent) { ... }
    private void lambda$snapToLocation$4(int, int, ValueAnimator) { ... }
    protected void onConfigurationChanged(Configuration) { ... }
    private void onDragAnimationUpdate(ValueAnimator, int, int) { ... }
    public boolean onInterceptTouchEvent(MotionEvent) { ... }
    private void sendDownAndUpKeyEvents() { ... }
    private void sendKeyEventIdentityCleared(int, long, long) { ... }
    public void setOnPanelChangeListener(SidebarPanelView$onPanelChangeListener) { ... }
    public void setShortcuts(List) { ... }
    public void show() { ... }
     void snapToLocation(int, int) { ... }
    public static float sq(float) { ... }
    private void startActivitySafely(View, SidebarShortcutInfo) { ... }
    private float transformCurrentPercentageXToEdge() { ... }
    private void updateDimensions() { ... }
    private void updateDisplaySizeWith(WindowMetrics) { ... }
    private void updateLocationWith(Position) { ... }
    private void updateStrokeWith(int) { ... }

}

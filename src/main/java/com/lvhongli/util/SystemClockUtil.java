package com.lvhongli.util;

import java.sql.Timestamp;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicLong;

/**
 * @Title: SystemClockUtil.java 
 * @Package com.amt.util 
 * @Description: TODO(高并发场景下System.currentTimeMillis()的性能问题的优化工具类) 
 * @author 江伟  
 * @date 2019年7月9日 下午5:18:40 
 * Copyright (c) ©1994-2019 Scjydz.com All Rights Reserved.
 */
public class SystemClockUtil {
	private final long period;
	private final AtomicLong now;

	private SystemClockUtil(long period) {
	        this.period = period;
	        this.now = new AtomicLong(System.currentTimeMillis());
	        scheduleClockUpdating();
	    }

	private static SystemClockUtil instance() {
		return InstanceHolder.INSTANCE;
	}

	/**
	 * @description: 调用此方法获取时间戳
	 * @return
	 */
	public static long now() {
		return instance().currentTimeMillis();
	}

	public static String nowDate() {
		return new Timestamp(instance().currentTimeMillis()).toString();
	}

	private void scheduleClockUpdating() {

		ScheduledThreadPoolExecutor scheduler = new ScheduledThreadPoolExecutor(1, new ThreadFactory() {
			@Override
			public Thread newThread(Runnable r) {
				Thread thread = new Thread(r, "System Clock");
				thread.setDaemon(true);
				return thread;
			}
		});

		scheduler.scheduleAtFixedRate(new Runnable() {
			@Override
			public void run() {
				now.set(System.currentTimeMillis());
			}
		}, period, period, TimeUnit.MILLISECONDS);
	}

	private long currentTimeMillis() {
		return now.get();
	}

	private static class InstanceHolder {
		public static final SystemClockUtil INSTANCE = new SystemClockUtil(1);
	}
 
}

package com.tigerft.tpu.web.jetty;

import org.mortbay.jetty.Connector;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.nio.SelectChannelConnector;
import org.mortbay.jetty.webapp.WebAppContext;
import org.mortbay.thread.QueuedThreadPool;



public class WebsiteRunner {
	private static Server server = new Server();

	public static void main(String[] args) throws Exception {

		QueuedThreadPool boundedThreadPool = new QueuedThreadPool();
		boundedThreadPool.setMaxThreads(5);
		server.setThreadPool(boundedThreadPool);
		//refer: http://jimichan.iteye.com/blog/601186
		/*String[] configFiles = {"com/netfinworks/fos/web/jetty/jetty.xml"};
		for(String configFile : configFiles) {
			URL url = new ClassPathResource(configFile).getFile().toURI().toURL();
			XmlConfiguration configuration = new XmlConfiguration(url);
			configuration.configure(server);
		}*/

		Connector connector = new SelectChannelConnector();
		connector.setPort(8080);
		server.addConnector(connector);

		WebAppContext context = new WebAppContext("src/main/webapp", "/tpu");
		//context.setOverrideDescriptor("src/main/java/com/netfinworks/fos/web/jetty/dev-web.xml");
		server.setHandler(context);

		server.setStopAtShutdown(true);
		server.setSendServerVersion(true);

		server.start();
		server.join();
	}
}

package airline;

import javafx.application.Preloader;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.image.Image;
import javafx.stage.Stage;
import javafx.stage.StageStyle;

public class MyPreloader extends Preloader {

	private Stage preloaderStage;
	private Scene scene;

	public MyPreloader() {

	}

	@Override
	public void init() throws Exception {

		Parent root1 = FXMLLoader.load(getClass().getResource("splashScreen.fxml"));
		scene = new Scene(root1);

	}

	@Override
	public void start(Stage primaryStage) throws Exception {

		this.preloaderStage = primaryStage;
		primaryStage.getIcons().add(new Image("/images/icon.png"));
		// Set preloader scene and show stage.
		preloaderStage.setScene(scene);
		preloaderStage.initStyle(StageStyle.UNDECORATED);
		preloaderStage.show();

	}

	@Override
	public void handleApplicationNotification(Preloader.PreloaderNotification info) {

		if (info instanceof ProgressNotification) {
			FXMLDocumentController.label.setText("Loading " + ((ProgressNotification) info).getProgress() * 100 + "%");
			System.out.println("Value@ :" + ((ProgressNotification) info).getProgress());

		}

	}

	@SuppressWarnings("incomplete-switch")
	@Override
	public void handleStateChangeNotification(Preloader.StateChangeNotification info) {

		StateChangeNotification.Type type = info.getType();
		switch (type) {

		case BEFORE_START:
			// Called after MyApplication#init and before MyApplication#start is called.
			System.out.println("BEFORE_START");
			preloaderStage.hide();
			break;
		}

	}
}
